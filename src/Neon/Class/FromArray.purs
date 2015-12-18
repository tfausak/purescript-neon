module Neon.Class.FromArray (class FromArray, fromArray) where

foreign import nativeFromArrayString :: Array Char -> String

class FromArray a b where
  fromArray :: Array a -> b

instance fromArrayArray :: FromArray a (Array a) where
  fromArray x = x

instance fromArrayString :: FromArray Char String where
  fromArray = nativeFromArrayString
