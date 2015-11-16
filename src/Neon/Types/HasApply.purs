module Neon.Types.HasApply
  ( HasApply
  , apply
  , (*>)
  , (<*)
  , (<*>)
  ) where

import Neon.Primitives.Function (always, flip, (|>))
import Neon.Types.HasIdentity (identity)
import Neon.Types.HasFold (sum)
import Neon.Types.HasMap (HasMap, map, (<$>))

-- | Represents types that can be applied from within a container. In other
-- | words, given both a function and a value in a container, apply the
-- | function to the value and return the result in a container. This is also
-- | known as an applicative functor.
-- |
-- | Laws:
-- | - Associative composition: `(<<) <$> f <*> g <*> h = f <*> (g <*> h)`
class (HasMap f) <= HasApply f where
  -- | Applies a function to and argument.
  -- |
  -- | ``` purescript
  -- | apply [(+ 2), (* 2)] [3, 4]
  -- | -- [5, 6, 6, 8]
  -- | ```
  apply :: forall a b. f (a -> b) -> f a -> f b

instance arrayHasApply :: HasApply Array where
  apply fs xs = fs |> map (flip map xs) |> sum

instance functionHasApply :: HasApply (Function a) where
  apply f g = \ x -> f x (g x)

-- | Alias for `apply`.
-- |
-- | ``` purescript
-- | [(+ 2), (* 2)] <*> [3, 4]
-- | -- [5, 6, 6, 8]
-- | ```
(<*>) :: forall f a b. (HasApply f) => f (a -> b) -> f a -> f b
(<*>) f x = apply f x
infixl 4 <*>

-- | Returns the second value but also evaluates the first.
-- |
-- | ``` purescript
-- | [1] *> [2]
-- | -- [2]
-- | ```
(*>) :: forall f a b. (HasApply f) => f a -> f b -> f b
(*>) x y = (always identity <$> x) <*> y
infixl 4 *>

-- | Returns the first value but also evaluates the second.
-- |
-- | ``` purescript
-- | [1] <* [2]
-- | -- [1]
-- | ```
(<*) :: forall f a b. (HasApply f) => f a -> f b -> f a
(<*) x y = (always <$> x) <*> y
infixl 4 <*
