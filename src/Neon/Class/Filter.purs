module Neon.Class.Filter (Filter, filter) where

import Data.Array as Array
import Neon.Data (List(Nil, Cons))

-- | Represents types than can have elements filtered out of them.
-- |
-- | ``` purescript
-- | filter (> 2) [1, 2, 3, 4] -- [3, 4]
-- | ```
class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter f xs = Array.filter f xs

instance filterList :: Filter List where
  filter f xs = case xs of
    Nil -> Nil
    Cons h t -> if f h then Cons h (filter f t) else filter f t
