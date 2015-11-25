module Neon.Types.HasNot
  ( HasNot
  , isInfinite
  , not
  , notEqual
  , (!=)
  ) where

import Neon.Primitives.Number (isFinite)
import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasTop (HasTop)
import Neon.Types.HasEqual (HasEqual, equal)

-- | Represents types can be "not"ed. This is also know as
-- | [negation](https://en.wikipedia.org/wiki/Negation).
-- |
-- | Laws:
-- | - `not top = bottom`
-- | - `not bottom = top`
class (HasBottom a, HasTop a) <= HasNot a where
  -- | Returns the logical negation of a value.
  -- |
  -- | ``` purescript
  -- | not false
  -- | -- true
  -- | ```
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = if x then false else true

instance functionHasNot :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)

-- | Tests whether a number is finite or not.
-- |
-- | ``` purescript
-- | isInfinite infinity
-- | -- true
-- | isInfinite 1.0
-- | -- false
-- | ```
isInfinite :: Number -> Boolean
isInfinite x = not (isFinite x)

-- | Returns `true` if two values are not equal, `false` otherwise.
-- |
-- | ``` purescript
-- | notEqual "a" "b"
-- | -- true
-- | ```
notEqual :: forall a. (HasEqual a) => a -> a -> Boolean
notEqual x y = not (equal x y)

-- | Alias for `notEqual`.
-- |
-- | ``` purescript
-- | "a" != "b"
-- | -- true
-- | ```
(!=) :: forall a. (HasEqual a) => a -> a -> Boolean
(!=) = notEqual
infix 4 !=
