module Neon.Types.HasSubtract
  ( HasSubtract
  , subtract
  , negate
  , (-)
  ) where

import Neon.Types.HasZero (HasZero, zero)

foreign import nativeSubtractInt :: Int -> Int -> Int
foreign import nativeSubtractNumber :: Number -> Number -> Number

-- | Laws:
-- | - Inverse: `a - a = a + (zero - a) = zero`
class (HasZero a) <= HasSubtract a where
  subtract :: a -> a -> a

instance functionHasSubtract :: (HasSubtract b) => HasSubtract (a -> b) where
  subtract f g = \ x -> f x - g x

instance intHasSubtract :: HasSubtract Int where
  subtract x y = nativeSubtractInt x y

instance numberHasSubtract :: HasSubtract Number where
  subtract x y = nativeSubtractNumber x y

-- | Alias for `subtract`.
(-) :: forall a. (HasSubtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -

negate :: forall a. (HasSubtract a) => a -> a
negate x = zero - x
