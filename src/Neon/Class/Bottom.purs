module Neon.Class.Bottom (Bottom, bottom) where

foreign import nativeBottomInt :: Int
foreign import nativeBottomNumber :: Number

class Bottom a where
  bottom :: a

instance bottomBoolean :: Bottom Boolean where
  bottom = false

instance bottomChar :: Bottom Char where
  bottom = '\0'

instance bottomInt :: Bottom Int where
  bottom = nativeBottomInt

instance bottomNumber :: Bottom Number where
  bottom = nativeBottomNumber
