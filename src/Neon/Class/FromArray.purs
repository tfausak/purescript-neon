module Neon.Class.FromArray (FromArray, fromArray) where

foreign import nativeFromArrayString :: Array Char -> String

class FromArray a b where
  fromArray :: Array a -> b

instance fromArrayString :: FromArray Char String where
  fromArray = nativeFromArrayString
