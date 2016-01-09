module Neon.Class.Map (Map, map) where

import Neon.Data (List(Nil, Cons))
import Prelude as Prelude

class Map a where
  map :: forall b c. (b -> c) -> a b -> a c

instance mapArray :: Map Array where
  map f xs = Prelude.map f xs

instance mapList :: Map List where
  map f xs = case xs of
    Nil -> Nil
    Cons h t -> Cons (f h) (map f t)
