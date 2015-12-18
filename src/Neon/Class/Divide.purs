module Neon.Class.Divide (class Divide, divide) where

import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

foreign import nativeDivide :: forall a. a -> a -> a

class Divide a where
  divide :: a -> a -> a

instance divideInt :: Divide Int where
  divide x y = truncate (divide (toNumber x) (toNumber y))

instance divideNumber :: Divide Number where
  divide = nativeDivide
