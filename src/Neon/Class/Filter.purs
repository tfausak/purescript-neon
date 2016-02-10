module Neon.Class.Filter where

import Data.Array as Array
import Data.List as List
import Neon.Data as Data

class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter f xs = Array.filter f xs

instance filterList :: Filter Data.List where
  filter f xs = List.filter f xs
