module Neon.Class.Reduce where

import Data.Foldable as Foldable
import Neon.Data as Data

class Reduce a where
  reduce :: forall b c. (c -> b -> c) -> c -> a b -> c

instance reduceArray :: Reduce Array where
  reduce f x xs = Foldable.foldl f x xs

instance reduceMaybe :: Reduce Data.Maybe where
  reduce f x mx = Foldable.foldl f x mx
