module Neon.Class.FromArray where

import Data.Array as Array
import Data.List as List
import Data.String as String
import Neon.Data as Data

-- | Represents types that can be converted from an array.
-- |
-- | ``` purescript
-- | fromArray [1] -- Cons 1 Nil
-- | ```
class FromArray a b where
  fromArray :: Array a -> b

instance fromArrayList :: FromArray a (Data.List a) where
  fromArray xs = List.toList xs

instance fromArrayMaybe :: FromArray a (Data.Maybe a) where
  fromArray xs = Array.head xs

instance fromArrayString :: FromArray Char String where
  fromArray xs = String.fromCharArray xs
