module Neon.Class.FromArray (FromArray, fromArray) where

import Data.Array as Array
import Data.List as List
import Data.String as String
import Neon.Data (List(), Maybe())

class FromArray a b where
  fromArray :: Array a -> b

instance fromArrayList :: FromArray a (List a) where
  fromArray xs = List.toList xs

instance fromArrayMaybe :: FromArray a (Maybe a) where
  fromArray xs = Array.head xs

instance fromArrayString :: FromArray Char String where
  fromArray xs = String.fromCharArray xs
