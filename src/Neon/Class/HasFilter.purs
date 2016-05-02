module Neon.Class.HasFilter where

import Data.Array as Array
import Data.List as List
import Neon.Data as Data

-- | Represents types that can have elements filtered out of them.
-- |
-- | ``` purescript
-- | [1, 2, 3, 4] :filter (_ > 2) -- [3, 4]
-- | ```
class HasFilter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance arrayHasFilter :: HasFilter Array where
  filter f xs = Array.filter f xs

instance listHasFilter :: HasFilter Data.List where
  filter f xs = List.filter f xs
