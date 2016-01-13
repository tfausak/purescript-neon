module Neon.Class.Map (class Map, map) where

import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just))
import Neon.Effect (Eff)
import Prelude (..) as Prelude

-- | Represents types that can be mapped over. This is also know as a
-- | [functor](https://en.wikipedia.org/wiki/Functor).
-- |
-- | ``` purescript
-- | map (+ 1) [1, 2, 3] -- [2, 3, 4]
-- | ```
-- |
-- | Laws:
-- | - `map identity = identity`
-- | - `map (compose g f) = compose (map g) (map f)
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
