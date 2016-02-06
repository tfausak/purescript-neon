module Neon.Class.Map where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

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

instance mapEff :: Map (Effect.Eff a) where
  map f x = Prelude.map f x

instance mapList :: Map Data.List where
  map f xs = case xs of
    Data.Nil -> Data.Nil
    Data.Cons h t -> Data.Cons (f h) (map f t)

instance mapMaybe :: Map Data.Maybe where
  map f mx = case mx of
    Data.Nothing -> Data.Nothing
    Data.Just x -> Data.Just (f x)
