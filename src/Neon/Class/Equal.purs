module Neon.Class.Equal (Equal, isEqual) where

import Prelude as Prelude

class Equal a where
  isEqual :: a -> a -> Boolean

-- TODO: instance equalArray :: (Equal a) => Equal (Array a) where

instance equalBoolean :: Equal Boolean where
  isEqual y x = Prelude.eq x y

instance equalChar :: Equal Char where
  isEqual y x = Prelude.eq x y

instance equalInt :: Equal Int where
  isEqual y x = Prelude.eq x y

-- TODO: instance equalList :: Equal List where

instance equalNumber :: Equal Number where
  isEqual y x = Prelude.eq x y

instance equalString :: Equal String where
  isEqual y x = Prelude.eq x y
