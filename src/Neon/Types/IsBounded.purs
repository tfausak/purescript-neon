module Neon.Types.IsBounded
  ( IsBounded
  , bottom
  , top
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasCompare
import Neon.Values.Ordering (Ordering(LessThan, GreaterThan))

foreign import nativeBottomChar :: Char
foreign import nativeBottomInt :: Int
foreign import nativeTopChar :: Char
foreign import nativeTopInt :: Int

-- | Laws:
-- | - `forall x. bottom <= x`
-- | - `forall x. top >= x`
class (HasCompare a) <= IsBounded a where
  bottom :: a
  top :: a

instance booleanIsBounded :: IsBounded Boolean where
  bottom = false
  top = true

instance charIsBounded :: IsBounded Char where
  bottom = nativeBottomChar
  top = nativeTopChar

instance intIsBounded :: IsBounded Int where
  bottom = nativeBottomInt
  top = nativeTopInt

instance orderingIsBounded :: IsBounded Ordering where
  bottom = LessThan
  top = GreaterThan
