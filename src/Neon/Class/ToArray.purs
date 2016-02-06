module Neon.Class.ToArray where

import Data.List as List
import Data.String as String
import Neon.Data as Data

-- | Represents types that can be converted to an array.
-- |
-- | ``` purescript
-- | toArray (Cons 1 Nil) -- [1]
-- | ```
class ToArray a b where
  toArray :: a -> Array b

instance toArrayList :: ToArray (Data.List a) a where
  toArray x = List.fromList x

instance toArrayMaybe :: ToArray (Data.Maybe a) a where
  toArray mx = case mx of
    Data.Nothing -> []
    Data.Just x -> [x]

instance toArrayString :: ToArray String Char where
  toArray x = String.toCharArray x
