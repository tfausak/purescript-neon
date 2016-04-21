module Neon.Class.Traverse where

import Neon.Class.Apply as Apply
import Neon.Class.FromArray as FromArray
import Neon.Class.Map as Map
import Neon.Class.Pure as Pure
import Neon.Class.ToArray as ToArray
import Neon.Data as Data

class Traverse t where
  traverse :: forall a b m. (Apply.Apply m, Map.Map m, Pure.Pure m) => (a -> m b) -> t a -> m (t b)

instance traverseArray :: Traverse Array where
  traverse f x = Map.map ToArray.toArray
    (traverse f ((FromArray.fromArray :: forall a. Array a -> Data.List a) x))

instance traverseList :: Traverse Data.List where
  traverse f xs = case xs of
    Data.Nil -> Pure.pure Data.Nil
    Data.Cons x l -> Apply.apply (Map.map Data.Cons (f x)) (traverse f l)

instance traverseMaybe :: Traverse Data.Maybe where
  traverse f mx = case mx of
    Data.Nothing -> Pure.pure Data.Nothing
    Data.Just x -> Map.map Data.Just (f x)
