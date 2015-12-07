module Neon.Class.Greater (Greater, greater) where

import Neon.Class.Equal (Equal)

foreign import nativeGreater :: forall a. a -> a -> Boolean
foreign import nativeGreaterArray :: forall a. (Equal a, Greater a) => Array a -> Array a -> Boolean

class Greater a where
  greater :: a -> a -> Boolean

instance greaterArray :: (Equal a, Greater a) => Greater (Array a) where
  greater = nativeGreaterArray

instance greaterBoolean :: Greater Boolean where
  greater = nativeGreater

instance greaterChar :: Greater Char where
  greater = nativeGreater

instance greaterInt :: Greater Int where
  greater = nativeGreater

instance greaterNumber :: Greater Number where
  greater = nativeGreater

instance greaterString :: Greater String where
  greater = nativeGreater
