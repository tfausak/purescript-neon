module Neon.Class.Divide (Divide, divide) where

foreign import nativeDivide :: forall a. a -> a -> a

class Divide a where
  divide :: a -> a -> a

instance divideInt :: Divide Int where
  divide = nativeDivide

instance divideNumber :: Divide Number where
  divide = nativeDivide
