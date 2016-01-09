module Neon.Class.Filter (Filter, filter) where

import Data.Array as Array
import Neon.Data (List(Nil, Cons))

class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter f xs = Array.filter f xs

instance filterList :: Filter List where
  filter f xs = case xs of
    Nil -> Nil
    Cons h t -> if f h then Cons h (filter f t) else filter f t
