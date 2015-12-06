module Neon.Class.Multiply (Multiply, multiply) where

foreign import nativeMultiply :: forall a. a -> a -> a

class Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply = nativeMultiply

instance multiplyNumber :: Multiply Number where
  multiply = nativeMultiply
