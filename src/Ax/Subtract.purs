module Ax.Subtract
  ( Subtract
  , negate
  , subtract
  , (-)
  ) where

import Ax.Zero (Zero, zero)

foreign import jsSubtractInt :: Int -> Int -> Int
foreign import jsSubtractNumber :: Number -> Number -> Number

class (Zero a) <= Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract x y = jsSubtractInt x y

instance subtractNumber :: Subtract Number where
  subtract x y = jsSubtractNumber x y

negate :: forall a. (Subtract a) => a -> a
negate x = zero - x

(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -
