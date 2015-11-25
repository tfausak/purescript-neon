module Neon.Values.Table
  ( Table()
  ) where

import Neon.Types.HasEqual (HasEqual)

data Color
  = Black
  | Red

instance colorHasEqual :: HasEqual Color where
  equal Black Black = true
  equal Red Red = true
  equal _ _ = false

type Height = Int

data Table k v
  = Leaf
  | Node Color Height (Table k v) k v (Table k v)
