module Neon.Class.Less (Less, less) where

import Neon.Class.Equal (Equal)

foreign import nativeLess :: forall a. a -> a -> Boolean
foreign import nativeLessArray :: forall a. (Equal a, Less a) => Array a -> Array a -> Boolean

class Less a where
  less :: a -> a -> Boolean

instance lessArray :: (Equal a, Less a) => Less (Array a) where
  less = nativeLessArray

instance lessBoolean :: Less Boolean where
  less = nativeLess

instance lessChar :: Less Char where
  less = nativeLess

instance lessInt :: Less Int where
  less = nativeLess

instance lessNumber :: Less Number where
  less = nativeLess

instance lessString :: Less String where
  less = nativeLess
