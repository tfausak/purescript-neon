module Neon.Class.HasApply where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

-- | Represents types that can be applied from within a container. In other
-- | words, given both a function and a value in a container, apply the
-- | function to the value and return the result in a container. This is also
-- | known as an applicative functor.
-- |
-- | ``` purescript
-- | [3, 4] :apply [(_ + 2), (_ * 2)] -- [5, 6, 6, 8]
-- | Just 2 :apply (Just (_ + 1)) -- Just 3
-- | ```
class HasApply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance arrayHasApply :: HasApply Array where
  apply f x = Prelude.apply f x

instance effHasApply :: HasApply (Effect.Eff a) where
  apply f x = Prelude.apply f x

instance listHasApply :: HasApply Data.List where
  apply f x = Prelude.apply f x

instance maybeHasApply :: HasApply Data.Maybe where
  apply f x = Prelude.apply f x
