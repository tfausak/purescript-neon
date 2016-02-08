module Neon.Class.Filter where

import Data.Array as Array

class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter f xs = Array.filter f xs
