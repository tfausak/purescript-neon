module Neon.Types.HasOne
  ( HasOne
  , one
  , sign
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasMultiply (HasMultiply)
import Neon.Types.HasSubtract (HasSubtract, negate)
import Neon.Types.HasZero (zero)
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

-- | Laws:
-- | - Identity: `one * x = x * one = x`
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

sign :: forall a. (HasCompare a, HasOne a, HasSubtract a) => a -> a
sign x = case compare x zero of
  LessThan -> negate one
  EqualTo -> zero
  GreaterThan -> one
