module Neon.Class.At where

import Data.Array as Array
import Data.List as List
import Neon.Data as Data

class At container index element where
  at :: index -> container -> Data.Maybe element

instance atArray :: At (Array a) Int a where
  at i xs = Array.index xs i

instance atList :: At (Data.List a) Int a where
  at i xs = List.index xs i
