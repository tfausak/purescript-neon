module Neon.Types.HasSubtract
  ( HasSubtract
  , subtract
  , (-)
  ) where

import Neon.Types.HasZero (HasZero, zero)

foreign import nativeSubtractInt :: Int -> Int -> Int
foreign import nativeSubtractNumber :: Number -> Number -> Number

-- | Laws:
-- | - Inverse: `a - a = a + (zero - a) = zero`
class (HasZero a) <= HasSubtract a where
  subtract :: a -> a -> a

instance subtractInt :: HasSubtract Int where
  subtract x y = nativeSubtractInt x y

instance subtractNumber :: HasSubtract Number where
  subtract x y = nativeSubtractNumber x y

-- | Alias for `subtract`.
(-) :: forall a. (HasSubtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -
