module Neon.Class.ToInt (ToInt, toInt) where

foreign import nativeToIntChar :: Char -> Int

class ToInt a where
  toInt :: a -> Int

instance toIntBoolean :: ToInt Boolean where
  toInt x = if x then 1 else 0

instance toIntChar :: ToInt Char where
  toInt = nativeToIntChar