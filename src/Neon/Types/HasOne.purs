module Neon.Types.HasOne
  ( HasOne
  , one
  , sign
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasMultiply (HasMultiply)
import Neon.Types.HasSubtract (HasSubtract, negate)
import Neon.Types.HasZero (zero)
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

-- | Represents types that have an multiplicative identity. This is also known
-- | as a [semiring](https://en.wikipedia.org/wiki/Semiring).
-- |
-- | Laws:
-- | - Identity: `one * x = x * one = x`
class (HasMultiply a) <= HasOne a where
  -- | Returns the multiplicative identity value.
  -- |
  -- | ``` purescript
  -- | one
  -- | -- 1
  -- | ```
  one :: a

instance booleanHasOne :: HasOne Boolean where
  one = true

instance functionHasOne :: (HasOne b) => HasOne (a -> b) where
  one = always one

instance intHasOne :: HasOne Int where
  one = 1

instance numberHasOne :: HasOne Number where
  one = 1.0

-- | Returns the sign of a value. For any value `x`, `sign x * abs x = x`.
-- |
-- | ``` purescript
-- | sign (-2)
-- | -- -1
-- | sign 0
-- | -- 0
-- | sign 2
-- | -- 1
-- | ```
sign :: forall a. (HasCompare a, HasOne a, HasSubtract a) => a -> a
sign x = case compare x zero of
  LessThan -> negate one
  EqualTo -> zero
  GreaterThan -> one
