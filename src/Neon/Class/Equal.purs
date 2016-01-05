module Neon.Class.Equal (Equal, isEqual) where

import Prelude as Prelude

class Equal a where
  isEqual :: a -> a -> Boolean

-- TODO: I need `map` and `reduce` for this.
-- instance equalArray :: (Equal a) => Equal (Array a) where
--   isEqual y x = x Prelude.== y

instance equalBoolean :: Equal Boolean where
  isEqual y x = x Prelude.== y

instance equalChar :: Equal Char where
  isEqual y x = x Prelude.== y

instance equalInt :: Equal Int where
  isEqual y x = x Prelude.== y

instance equalNumber :: Equal Number where
  isEqual y x = x Prelude.== y

instance equalString :: Equal String where
  isEqual y x = x Prelude.== y
