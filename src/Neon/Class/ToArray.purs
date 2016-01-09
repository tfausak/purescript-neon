module Neon.Class.ToArray (ToArray, toArray) where

import Data.List as List
import Data.String as String

class ToArray a b where
  toArray :: a -> Array b

instance toArrayList :: ToArray (List.List a) a where
  toArray x = List.fromList x

instance toArrayString :: ToArray String Char where
  toArray x = String.toCharArray x
