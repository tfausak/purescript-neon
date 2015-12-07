module Neon.Class.ToArray (ToArray, toArray) where

foreign import nativeToArrayString :: String -> Array Char

class ToArray a b where
  toArray :: a -> Array b

instance toArrayArray :: ToArray (Array a) a where
  toArray x = x

instance toArrayString :: ToArray String Char where
  toArray = nativeToArrayString
