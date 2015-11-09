module Neon.Types.HasTop
  ( HasTop
  , top
  ) where

import Neon.Types.HasCompare (HasCompare)
import Neon.Values.Ordering (Ordering(GreaterThan))

foreign import nativeTopChar :: Char
foreign import nativeTopInt :: Int

-- | Laws:
-- | - `top >= x`
class (HasCompare a) <= HasTop a where
  top :: a

instance booleanHasTop :: HasTop Boolean where
  top = true

instance charHasTop :: HasTop Char where
  top = nativeTopChar

instance intHasTop :: HasTop Int where
  top = nativeTopInt

instance orderingHasTop :: HasTop Ordering where
  top = GreaterThan
