module Neon.Types.HasTop
  ( HasTop
  , top
  ) where

import Neon.Primitives.Function (always)
import Neon.Primitives.Number (infinity)
import Neon.Types.HasCompare (HasCompare)
import Neon.Values.Ordering (Ordering(GreaterThan))

-- | Represents types that have an upper bound.
-- |
-- | Laws:
-- | - `top >= x`
class (HasCompare a) <= HasTop a where
  -- | Returns the upper bound value.
  -- |
  -- | ``` purescript
  -- | top
  -- | -- true
  -- | ```
  top :: a

instance booleanHasTop :: HasTop Boolean where
  top = true

instance charHasTop :: HasTop Char where
  top = '\65535'

instance functionHasTop :: (HasTop b) => HasTop (a -> b) where
  top = always top

instance intHasTop :: HasTop Int where
  top = 2147483647

instance numberHasTop :: HasTop Number where
  top = infinity

instance orderingHasTop :: HasTop Ordering where
  top = GreaterThan
