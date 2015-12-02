module Neon.Types.HasBottom
  ( HasBottom
  , bottom
  ) where

import Neon.Primitives.Function (always)
import Neon.Primitives.Number (infinity)
import Neon.Types.HasCompare (HasCompare)
import Neon.Types.HasSubtract (negate)
import Neon.Values.Ordering (Ordering(LessThan))

-- | Represents types that have a lower bound.
-- |
-- | Laws:
-- | - `bottom <= x`
class (HasCompare a) <= HasBottom a where
  -- | Returns the lower bound value.
  -- |
  -- | ``` purescript
  -- | bottom
  -- | -- false
  -- | ```
  bottom :: a

instance booleanHasBottom :: HasBottom Boolean where
  bottom = false

instance charHasBottom :: HasBottom Char where
  bottom = '\0'

instance functionHasBottom :: (HasBottom b) => HasBottom (a -> b) where
  bottom = always bottom

instance intHasBottom :: HasBottom Int where
  bottom = -2147483648

instance numberHasBottom :: HasBottom Number where
  bottom = -infinity

instance orderingHasBottom :: HasBottom Ordering where
  bottom = LessThan
