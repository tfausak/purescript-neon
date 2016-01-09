module Neon.Class.Map (Map, map) where

import Prelude as Prelude

class Map a where
  map :: forall b c. (b -> c) -> a b -> a c

instance mapArray :: Map Array where
  map f xs = Prelude.map f xs
