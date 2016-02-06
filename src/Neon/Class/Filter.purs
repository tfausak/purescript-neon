module Neon.Class.Filter where

import Data.Array as Array
import Neon.Data as Data

-- | Represents types than can have elements filtered out of them.
-- |
-- | ``` purescript
-- | filter (> 2) [1, 2, 3, 4] -- [3, 4]
-- | ```
class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter f xs = Array.filter f xs

instance filterList :: Filter Data.List where
  filter f xs = case xs of
    Data.Nil -> Data.Nil
    Data.Cons h t -> if f h then Data.Cons h (filter f t) else filter f t
