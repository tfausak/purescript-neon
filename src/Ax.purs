module Ax where

class Add a where
  add :: a -> a -> a

foreign import addInt :: Int -> Int -> Int
instance addInt' :: Add Int where
  add x y = addInt x y

foreign import addNumber :: Number -> Number -> Number
instance addNumber' :: Add Number where
  add x y = addNumber x y

(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add x y
infixl 6 +

class (Add a) <= Zero a where
  zero :: a

instance zeroInt :: Zero Int where
  zero = 0

instance zeroNumber :: Zero Number where
  zero = 0.0
