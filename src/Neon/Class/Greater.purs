module Neon.Class.Greater (Greater, isGreater) where

import Prelude as Prelude

class Greater a where
  isGreater :: a -> a -> Boolean

-- TODO: instance greaterArray :: (Greater a) => Greater (Array a) where

instance greaterBoolean :: Greater Boolean where
  isGreater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  isGreater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  isGreater y x = x Prelude.> y

-- TODO: instance greaterList :: (Greater a) => Greater (List a) where

instance greaterNumber :: Greater Number where
  isGreater y x = x Prelude.> y

instance greaterString :: Greater String where
  isGreater y x = x Prelude.> y
