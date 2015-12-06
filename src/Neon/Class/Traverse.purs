module Neon.Class.Traverse (Traverse, traverse) where

import Neon.Class.Apply (Apply, apply)
import Neon.Class.FromArray (fromArray)
import Neon.Class.Map (Map, map)
import Neon.Class.Pure (Pure, pure)
import Neon.Class.ToArray (toArray)
import Neon.Data.List (List(Nil, Cons))

class Traverse t where
  traverse :: forall a b m. (Apply m, Map m, Pure m) => (a -> m b) -> t a -> m (t b)

instance arrayTraverse :: Traverse Array where
  traverse f x =
    let toList :: forall a. Array a -> List a
        toList = fromArray
    in  map toArray (traverse f (toList x))

instance listTraverse :: Traverse List where
  traverse f xs = case xs of
    Nil -> pure Nil
    Cons x l -> apply (map Cons (f x)) (traverse f l)
