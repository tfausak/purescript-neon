module Neon.Class.HasReduce where

import Data.Foldable as Foldable
import Neon.Data as Data

class HasReduce a where
  reduce :: forall b c. (c -> b -> c) -> c -> a b -> c

instance arrayHasReduce :: HasReduce Array where
  reduce f x xs = Foldable.foldl f x xs

instance listHasReduce :: HasReduce Data.List where
  reduce f x xs = Foldable.foldl f x xs

instance maybeHasReduce :: HasReduce Data.Maybe where
  reduce f x mx = Foldable.foldl f x mx
