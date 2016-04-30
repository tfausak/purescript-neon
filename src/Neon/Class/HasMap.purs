module Neon.Class.HasMap where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

-- | Represents types that can be mapped over. This is also know as a
-- | [functor](https://en.wikipedia.org/wiki/Functor).
-- |
-- | ``` purescript
-- | [1, 2, 3] :map (_ + 1) -- [2, 3, 4]
-- | ```
class HasMap a where
  map :: forall b c. (b -> c) -> a b -> a c

instance arrayHasMap :: HasMap Array where
  map f x = Prelude.map f x

instance effHasMap :: HasMap (Effect.Eff a) where
  map f x = Prelude.map f x

instance listHasMap :: HasMap Data.List where
  map f x = Prelude.map f x

instance maybeHasMap :: HasMap Data.Maybe where
  map f x = Prelude.map f x
