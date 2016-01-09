module Neon.Class.FromArray (FromArray, fromArray) where

import Data.List as List
import Data.String as String

class FromArray a b where
  fromArray :: Array a -> b

instance fromArrayList :: FromArray a (List.List a) where
  fromArray xs = List.toList xs

instance fromArrayString :: FromArray Char String where
  fromArray xs = String.fromCharArray xs
