module Neon.Class.Traverse (class Traverse, traverse) where

import Neon.Class.Apply (class Apply, apply)
import Neon.Class.FromArray (fromArray)
import Neon.Class.Map (class Map, map)
import Neon.Class.Pure (class Pure, pure)
import Neon.Class.ToArray (toArray)
import Neon.Data.List (List(Nil, Cons))

class Traverse t where
  traverse :: forall a b m. (Apply m, Map m, Pure m) => (a -> m b) -> t a -> m (t b)

instance arrayTraverse :: Traverse Array where
  traverse f x = map toArray
    (traverse f ((fromArray :: forall a. Array a -> List a) x))

instance listTraverse :: Traverse List where
  traverse f xs = case xs of
    Nil -> pure Nil
    Cons x l -> apply (map Cons (f x)) (traverse f l)
