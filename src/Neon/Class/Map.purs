module Neon.Class.Map (Map, map) where

import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just))
import Neon.Effect (Eff())
import Prelude as Prelude

class Map a where
  map :: forall b c. (b -> c) -> a b -> a c

instance mapArray :: Map Array where
  map f xs = Prelude.map f xs

instance mapEff :: Map (Eff a) where
  map f x = Prelude.map f x

instance mapList :: Map List where
  map f xs = case xs of
    Nil -> Nil
    Cons h t -> Cons (f h) (map f t)

instance mapMaybe :: Map Maybe where
  map f mx = case mx of
    Nothing -> Nothing
    Just x -> Just (f x)
