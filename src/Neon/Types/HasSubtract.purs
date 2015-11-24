module Neon.Types.HasSubtract
  ( HasSubtract
  , abs
  , negate
  , subtract
  , (-)
  ) where

import Neon.Types.HasCompare (HasCompare, (<))
import Neon.Types.HasZero (HasZero, zero)

foreign import nativeSubtractInt :: Int -> Int -> Int
foreign import nativeSubtractNumber :: Number -> Number -> Number

-- | Represents types that can be subtracted from each other.
-- |
-- | Laws:
-- | - Inverse: `a - a = a + (zero - a) = zero`
class (HasZero a) <= HasSubtract a where
  -- | Subtracts one value from another.
  -- |
  -- | ``` purescript
  -- | subtract 3 2
  -- | -- 1
  -- | ```
  subtract :: a -> a -> a

instance functionHasSubtract :: (HasSubtract b) => HasSubtract (a -> b) where
  subtract f g = \ x -> f x - g x

instance intHasSubtract :: HasSubtract Int where
  subtract x y = nativeSubtractInt x y

instance numberHasSubtract :: HasSubtract Number where
  subtract x y = nativeSubtractNumber x y

-- | Alias for `subtract`.
-- |
-- | ``` purescript
-- | 3 - 2
-- | -- 1
-- | ```
(-) :: forall a. (HasSubtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -

-- | Negates a value. This is the same as subtracting the value from zero.
-- |
-- | ``` purescript
-- | negate 1
-- | -- -1
-- | ```
negate :: forall a. (HasSubtract a) => a -> a
negate x = zero - x

-- | Returns the absolute value of a value. If the value is negative, this
-- | returns it negated. Otherwise it returns the value.
-- |
-- | ``` purescript
-- | abs 1
-- | -- 1
-- | abs (-1)
-- | -- 1
-- | ```
abs :: forall a. (HasCompare a, HasSubtract a) => a -> a
abs x = if x < zero then -x else x
