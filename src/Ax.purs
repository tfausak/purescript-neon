module Ax where

class Add a where
  add :: a -> a -> a

foreign import jsAddInt :: Int -> Int -> Int
instance addInt :: Add Int where
  add x y = jsAddInt x y

foreign import jsAddNumber :: Number -> Number -> Number
instance addNumber :: Add Number where
  add x y = jsAddNumber x y

(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add x y
infixl 6 +

class (Add a) <= Zero a where
  zero :: a

instance zeroInt :: Zero Int where
  zero = 0

instance zeroNumber :: Zero Number where
  zero = 0.0

class (Zero a) <= Subtract a where
  subtract :: a -> a -> a

foreign import jsSubtractInt :: Int -> Int -> Int
instance subtractInt :: Subtract Int where
  subtract x y = jsSubtractInt x y

foreign import jsSubtractNumber :: Number -> Number -> Number
instance subtractNumber :: Subtract Number where
  subtract x y = jsSubtractNumber x y

(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -

negate :: forall a. (Subtract a) => a -> a
negate x = zero - x

class (Add a) <= Multiply a where
  multiply :: a -> a -> a

foreign import jsMultiplyInt :: Int -> Int -> Int
instance multiplyInt :: Multiply Int where
  multiply x y = jsMultiplyInt x y

foreign import jsMultiplyNumber :: Number -> Number -> Number
instance multiplyNumber :: Multiply Number where
  multiply x y = jsMultiplyNumber x y

(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply x y
infixl 7 *

class (Multiply a) <= One a where
  one :: a

instance oneInt :: One Int where
  one = 1

instance oneNumber :: One Number where
  one = 1.0
