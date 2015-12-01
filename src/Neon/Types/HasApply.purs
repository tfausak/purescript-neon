module Neon.Types.HasApply
  ( HasApply
  , apply
  ) where

import Neon.Primitives.Function (flip, (|>))
import Neon.Types.HasFold (sum)
import Neon.Types.HasMap (HasMap, map)

-- | Represents types that can be applied from within a container. In other
-- | words, given both a function and a value in a container, apply the
-- | function to the value and return the result in a container. This is also
-- | known as an applicative functor.
-- |
-- | Laws:
-- | - Associative composition: `apply (apply (map (<<) f) g) h = apply f (apply g h)`
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
