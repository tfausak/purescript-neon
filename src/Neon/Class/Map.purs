module Neon.Class.Map where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class Map a where
  map :: forall b c. (b -> c) -> a b -> a c

instance mapArray :: Map Array where
  map f x = Prelude.map f x

instance mapEff :: Map (Effect.Eff a) where
  map f x = Prelude.map f x

instance mapMaybe :: Map Data.Maybe where
  map f x = Prelude.map f x
