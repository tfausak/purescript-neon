module Neon.Class.Equal (Equal, equal) where

foreign import nativeEqual :: forall a. a -> a -> Boolean

class Equal a where
  equal :: a -> a -> Boolean

instance equalBoolean :: Equal Boolean where
  equal = nativeEqual

instance equalString :: Equal String where
  equal = nativeEqual
