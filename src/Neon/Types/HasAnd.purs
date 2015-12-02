module Neon.Types.HasAnd
  ( HasAnd
  , and
  , (&&)
  ) where

import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasMultiply ((*))
import Neon.Types.HasTop (HasTop)

-- | Represents types than can be "and"ed together. This is also known as a
-- | [logical conjunction](https://en.wikipedia.org/wiki/Logical_conjunction).
-- |
-- | Laws:
-- | - Associativity: `x && (y && z) = (x && y) && z`
-- | - Commutativity: `x && y = y && x`
-- | - Identity: `x && top = x`
-- | - Annihiliation: `x && bottom = bottom`
-- | - Idempotence: `x && x = x`
class (HasBottom a, HasTop a) <= HasAnd a where
  -- | "And"s two values together.
  -- |
  -- | ``` purescript
  -- | and true true
  -- | -- true
  -- | ```
  and :: a -> a -> a

instance booleanHasAnd :: HasAnd Boolean where
  and x y = x * y

instance functionHasAnd :: (HasAnd b) => HasAnd (a -> b) where
  and f g = \ x -> f x && g x

-- | Alias for `and`.
-- |
-- | ``` purescript
-- | true && true
-- | -- true
-- | ```
(&&) :: forall a. (HasAnd a) => a -> a -> a
(&&) = and
infixr 3 &&
