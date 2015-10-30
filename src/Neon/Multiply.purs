module Neon.Multiply
  ( Multiply
  , multiply
  , (*)
  ) where

import Neon.Zero (Zero)

foreign import jsMultiplyInt :: Int -> Int -> Int
foreign import jsMultiplyNumber :: Number -> Number -> Number

-- | Laws:
-- | - Associativity: `x * (y * z) = (x * y) * z`
-- | - Distributivity: `x * (y + z) = (x * y) + (x * z)`
-- | - Annihilation: `x * zero = zero * x = zero`
class (Zero a) <= Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply x y = jsMultiplyInt x y

instance multiplyNumber :: Multiply Number where
  multiply x y = jsMultiplyNumber x y

-- | Alias for `multiply`.
(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply x y
infixl 7 *
