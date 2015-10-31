module Neon.Types.Subtract
  ( Subtract
  , subtract
  , (-)
  ) where

import Neon.Types.Zero (Zero, zero)

foreign import nativeSubtractInt :: Int -> Int -> Int
foreign import nativeSubtractNumber :: Number -> Number -> Number

-- | Laws:
-- | - Inverse: `a - a = a + (zero - a) = zero`
class (Zero a) <= Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract x y = nativeSubtractInt x y

instance subtractNumber :: Subtract Number where
  subtract x y = nativeSubtractNumber x y

-- | Alias for `subtract`.
(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -
