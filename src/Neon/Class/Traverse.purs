module Neon.Class.Traverse (Traverse, traverse) where

import Neon.Class.Apply (Apply, apply)
import Neon.Class.FromArray (fromArray)
import Neon.Class.Map (Map, map)
import Neon.Class.Wrap (Wrap, wrap)
import Neon.Class.ToArray (toArray)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just))

-- | Represents data structures that can be traversed from left to right.
-- | Unlike `Reduce`, these structures can be traversed while keeping their
-- | shape.
-- |
-- | Examples:
-- | ``` purescript
-- | traverse (compose Just show) [1, 2] -- Just ["1", "2"]
-- | ```
-- |
-- | Laws:
-- | - `compose t (traverse f) = traverse (compose t f)`
class Traverse t where
  traverse :: forall a b m. (Apply m, Map m, Wrap m) => (a -> m b) -> t a -> m (t b)

instance traverseArray :: Traverse Array where
  traverse f x = map toArray
    (traverse f ((fromArray :: forall a. Array a -> List a) x))

instance traverseList :: Traverse List where
  traverse f xs = case xs of
    Nil -> wrap Nil
    Cons x l -> apply (map Cons (f x)) (traverse f l)

instance traverseMaybe :: Traverse Maybe where
  traverse f mx = case mx of
    Nothing -> wrap Nothing
    Just x -> map Just (f x)
