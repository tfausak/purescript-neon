module Neon.Class.HasTraverse where

import Neon.Class.HasApply as HasApply
import Neon.Class.HasFromArray as HasFromArray
import Neon.Class.HasMap as HasMap
import Neon.Class.HasPure as HasPure
import Neon.Class.HasToArray as HasToArray
import Neon.Data as Data

-- | Represents data structures that can be traversed from left to right.
-- | Unlike `Reduce`, these structures can be traversed while keeping their
-- | shape.
-- |
-- | ``` purescript
-- | [1, 2] :traverse (\ x -> x :inspect :Just) -- Just ["1", "2"]
-- | ```
class HasTraverse t where
  traverse :: forall a b m. HasApply.HasApply m => HasMap.HasMap m => HasPure.HasPure m => (a -> m b) -> t a -> m (t b)

instance lrrayHasTraverse :: HasTraverse Array where
  traverse f x = HasMap.map HasToArray.toArray
    (traverse f ((HasFromArray.fromArray :: forall a. Array a -> Data.List a) x))

instance listHasTraverse :: HasTraverse Data.List where
  traverse f xs = case xs of
    Data.Nil -> HasPure.pure Data.Nil
    Data.Cons x l -> HasApply.apply (HasMap.map Data.Cons (f x)) (traverse f l)

instance laybeHasTraverse :: HasTraverse Data.Maybe where
  traverse f mx = case mx of
    Data.Nothing -> HasPure.pure Data.Nothing
    Data.Just x -> HasMap.map Data.Just (f x)
