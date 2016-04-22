module Neon.Class.HasFilter where

import Data.Array as Array
import Data.List as List
import Neon.Data as Data

class HasFilter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance arrayHasFilter :: HasFilter Array where
  filter f xs = Array.filter f xs

instance listHasFilter :: HasFilter Data.List where
  filter f xs = List.filter f xs
