module Neon.Primitive.Char
  ( toLower
  , toString
  , toUpper
  ) where

foreign import nativeToLower :: Char -> Char
foreign import nativeToString :: Char -> String
foreign import nativeToUpper :: Char -> Char

toLower :: Char -> Char
toLower = nativeToLower

toString :: Char -> String
toString = nativeToString

toUpper :: Char -> Char
toUpper = nativeToUpper
