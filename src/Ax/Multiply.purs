module Ax.Multiply
  ( Multiply
  , multiply
  , (*)
  ) where

import Ax.Add (Add)

foreign import jsMultiplyInt :: Int -> Int -> Int
foreign import jsMultiplyNumber :: Number -> Number -> Number

class (Add a) <= Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply x y = jsMultiplyInt x y

instance multiplyNumber :: Multiply Number where
  multiply x y = jsMultiplyNumber x y

(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply x y
infixl 7 *
