module Neon.Class.ToArray where

import Data.List as List
import Data.String as String
import Neon.Data as Data

class ToArray a b where
  toArray :: a -> Array b

instance toArrayList :: ToArray (Data.List a) a where
  toArray xs = List.toUnfoldable xs

instance toArrayMaybe :: ToArray (Data.Maybe a) a where
  toArray mx = case mx of
    Data.Nothing -> []
    Data.Just x -> [x]

instance toArrayString :: ToArray String Char where
  toArray x = String.toCharArray x
