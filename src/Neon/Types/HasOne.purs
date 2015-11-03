module Neon.Types.HasOne
  ( HasOne
  , one
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasMultiply (HasMultiply)

-- | Laws:
-- | - HasIdentity: `one * x = x * one = x`
class (HasMultiply a) <= HasOne a where
  one :: a

instance booleanHasOne :: HasOne Boolean where
  one = true

instance functionHasOne :: (HasOne b) => HasOne (a -> b) where
  one = constant one

instance intHasOne :: HasOne Int where
  one = 1

instance numberHasOne :: HasOne Number where
  one = 1.0
