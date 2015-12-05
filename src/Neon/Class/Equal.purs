module Neon.Class.Equal (Equal, equal) where

foreign import nativeEqual :: forall a. a -> a -> Boolean

class Equal a where
  equal :: a -> a -> Boolean

instance equalBoolean :: Equal Boolean where
  equal x y = case { x: x, y: y } of
    { x: false, y: false } -> true
    { x: true, y: true } -> true
    _ -> false

instance equalString :: Equal String where
  equal = nativeEqual
