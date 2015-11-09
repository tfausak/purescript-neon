module Neon.Types.HasBottom
  ( HasBottom
  , bottom
  ) where

import Neon.Types.HasCompare (HasCompare)
import Neon.Values.Ordering (Ordering(LessThan))

foreign import nativeBottomChar :: Char
foreign import nativeBottomInt :: Int

-- | Laws:
-- | - `bottom <= x`
class (HasCompare a) <= HasBottom a where
  bottom :: a

instance booleanHasBottom :: HasBottom Boolean where
  bottom = false

instance charHasBottom :: HasBottom Char where
  bottom = nativeBottomChar

instance intHasBottom :: HasBottom Int where
  bottom = nativeBottomInt

instance orderingHasBottom :: HasBottom Ordering where
  bottom = LessThan
