module Neon.Class.Multiply (class Multiply, multiply) where

import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

foreign import nativeMultiply :: forall a. a -> a -> a

class Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply x y = truncate (multiply (toNumber x) (toNumber y))

instance multiplyNumber :: Multiply Number where
  multiply = nativeMultiply
