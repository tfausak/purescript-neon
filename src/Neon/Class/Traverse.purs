module Neon.Class.Traverse where

import Neon.Class.Apply as Apply
import Neon.Class.FromArray as FromArray
import Neon.Class.Map as Map
import Neon.Class.Wrap as Wrap
import Neon.Class.ToArray as ToArray
import Neon.Data as Data

-- | Represents data structures that can be traversed from left to right.
-- | Unlike `Reduce`, these structures can be traversed while keeping their
-- | shape.
-- |
-- | ``` purescript
-- | traverse (compose Just show) [1, 2] -- Just ["1", "2"]
-- | ```
-- |
-- | Laws:
-- | - `compose t (traverse f) = traverse (compose t f)`
class Traverse t where
  traverse :: forall a b m. (Apply.Apply m, Map.Map m, Wrap.Wrap m) => (a -> m b) -> t a -> m (t b)

instance traverseArray :: Traverse Array where
  traverse f x = Map.map ToArray.toArray
    (traverse f ((FromArray.fromArray :: forall a. Array a -> Data.List a) x))

instance traverseList :: Traverse Data.List where
  traverse f xs = case xs of
    Data.Nil -> Wrap.wrap Data.Nil
    Data.Cons x l -> Apply.apply (Map.map Data.Cons (f x)) (traverse f l)

instance traverseMaybe :: Traverse Data.Maybe where
  traverse f mx = case mx of
    Data.Nothing -> Wrap.wrap Data.Nothing
    Data.Just x -> Map.map Data.Just (f x)
