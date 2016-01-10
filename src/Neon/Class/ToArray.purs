module Neon.Class.ToArray (ToArray, toArray) where

import Data.List as List
import Data.String as String
import Neon.Data(List(), Maybe(Nothing, Just))

class ToArray a b where
  toArray :: a -> Array b

instance toArrayList :: ToArray (List a) a where
  toArray x = List.fromList x

instance toArrayMaybe :: ToArray (Maybe a) a where
  toArray mx = case mx of
    Nothing -> []
    Just x -> [x]

instance toArrayString :: ToArray String Char where
  toArray x = String.toCharArray x
