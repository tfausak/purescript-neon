module Neon.Class.Traverse (Traverse, traverse) where

import Neon.Class.Apply (Apply, apply)
import Neon.Class.FromArray (fromArray)
import Neon.Class.Map (Map, map)
import Neon.Class.Wrap (Wrap, wrap)
import Neon.Class.ToArray (toArray)
import Neon.Data (List(Nil, Cons))

class Traverse t where
  traverse :: forall a b m. (Apply m, Map m, Wrap m) => (a -> m b) -> t a -> m (t b)

instance arrayTraverse :: Traverse Array where
  traverse f x = map toArray
    (traverse f ((fromArray :: forall a. Array a -> List a) x))

instance listTraverse :: Traverse List where
  traverse f xs = case xs of
    Nil -> wrap Nil
    Cons x l -> apply (map Cons (f x)) (traverse f l)
