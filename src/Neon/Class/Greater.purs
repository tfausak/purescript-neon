module Neon.Class.Greater (Greater, isGreater) where

import Prelude as Prelude

class Greater a where
  isGreater :: a -> a -> Boolean

-- TODO: I need `map` and `reduce` for this.
-- instance greaterArray :: (Greater a) => Greater (Array a) where
--   isGreater y x = x Prelude.> y

instance greaterBoolean :: Greater Boolean where
  isGreater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  isGreater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  isGreater y x = x Prelude.> y

instance greaterNumber :: Greater Number where
  isGreater y x = x Prelude.> y

instance greaterString :: Greater String where
  isGreater y x = x Prelude.> y
