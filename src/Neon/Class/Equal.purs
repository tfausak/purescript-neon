module Neon.Class.Equal (Equal, equal) where

foreign import nativeEqual :: forall a. a -> a -> Boolean
foreign import nativeEqualArray :: forall a. (Equal a) => Array a -> Array a -> Boolean

class Equal a where
  equal :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  equal = nativeEqualArray

instance equalBoolean :: Equal Boolean where
  equal = nativeEqual

instance equalChar :: Equal Char where
  equal = nativeEqual

instance equalInt :: Equal Int where
  equal = nativeEqual

instance equalNumber :: Equal Number where
  equal = nativeEqual

instance equalString :: Equal String where
  equal = nativeEqual
