module Ax.Divide
  ( Divide
  , divide
  , modulo
  , (/)
  , (%)
  ) where

import Ax.Multiply (Multiply)

foreign import jsDivideInt :: Int -> Int -> Int
foreign import jsModuloInt :: Int -> Int -> Int
foreign import jsDivideNumber :: Number -> Number -> Number

class (Multiply a) <= Divide a where
  divide :: a -> a -> a
  modulo :: a -> a -> a

instance divideInt :: Divide Int where
  divide x y = jsDivideInt x y
  modulo x y = jsModuloInt x y

instance divideNumber :: Divide Number where
  divide x y = jsDivideNumber x y
  modulo _ _ = 0.0

(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide x y
infixl 7 /

(%) :: forall a. (Divide a) => a -> a -> a
(%) x y = modulo x y
infixl 7 %
