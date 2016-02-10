module Neon.Class.Greater where

import Neon.Class.Equal as Equal
import Prelude as Prelude

class Greater a where
  greater :: a -> a -> Boolean

-- instance greaterArray :: (Equal.Equal a, Greater a) => Greater (Array a) where
--   greater ys xs = false -- TODO

instance greaterBoolean :: Greater Boolean where
  greater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  greater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  greater y x = x Prelude.> y

instance greaterNumber :: Greater Number where
  greater y x = x Prelude.> y

instance greaterString :: Greater String where
  greater y x = x Prelude.> y
