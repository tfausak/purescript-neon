module Neon.Class.Reduce (Reduce, reduce) where

import Data.Foldable as Foldable
import Neon.Data (List())

class Reduce a where
  reduce :: forall b c. (c -> b -> c) -> c -> a b -> c

instance reduceArray :: Reduce Array where
  reduce f x xs = Foldable.foldl f x xs

instance reduceList :: Reduce List where
  reduce f x xs = Foldable.foldl f x xs