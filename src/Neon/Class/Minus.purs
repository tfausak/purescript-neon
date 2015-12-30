module Neon.Class.Minus (class Minus, minus) where

import Neon.Class.Equal (class Equal)

foreign import nativeMinus :: forall a. a -> a -> a
foreign import nativeMinusArray :: forall a. (Equal a) => Array a -> Array a -> Array a

class Minus a where
  minus :: a -> a -> a

instance minusArray :: (Equal a) => Minus (Array a) where
  minus = nativeMinusArray

instance minusInt :: Minus Int where
  minus = nativeMinus

instance minusNumber :: Minus Number where
  minus = nativeMinus
