module Neon.Class.HasMap where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

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
