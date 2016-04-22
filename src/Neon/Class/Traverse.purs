module Neon.Class.Traverse where

import Neon.Class.HasApply as HasApply
import Neon.Class.HasFromArray as HasFromArray
import Neon.Class.HasMap as HasMap
import Neon.Class.HasPure as HasPure
import Neon.Class.HasToArray as HasToArray
import Neon.Data as Data

class Traverse t where
  traverse :: forall a b m. (HasApply.HasApply m, HasMap.HasMap m, HasPure.HasPure m) => (a -> m b) -> t a -> m (t b)

instance traverseArray :: Traverse Array where
  traverse f x = HasMap.map HasToArray.toArray
    (traverse f ((HasFromArray.fromArray :: forall a. Array a -> Data.List a) x))

instance traverseList :: Traverse Data.List where
  traverse f xs = case xs of
    Data.Nil -> HasPure.pure Data.Nil
    Data.Cons x l -> HasApply.apply (HasMap.map Data.Cons (f x)) (traverse f l)

instance traverseMaybe :: Traverse Data.Maybe where
  traverse f mx = case mx of
    Data.Nothing -> HasPure.pure Data.Nothing
    Data.Just x -> HasMap.map Data.Just (f x)
