module Neon.Subtract
  ( Subtract
  , subtract
  , (-)
  ) where

import Neon.Zero (Zero, zero)

foreign import jsSubtractInt :: Int -> Int -> Int
foreign import jsSubtractNumber :: Number -> Number -> Number

-- | Laws:
-- | - Inverse: `a - a = a + (zero - a) = zero`
class (Zero a) <= Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract x y = jsSubtractInt x y

instance subtractNumber :: Subtract Number where
  subtract x y = jsSubtractNumber x y

-- | Alias for `subtract`.
(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -
