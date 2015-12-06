module Neon.Class.Subtract (Subtract, subtract) where

foreign import nativeSubtract :: forall a. a -> a -> a

class Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract = nativeSubtract

instance subtractNumber :: Subtract Number where
  subtract = nativeSubtract
