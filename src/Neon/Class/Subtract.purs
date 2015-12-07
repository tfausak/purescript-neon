module Neon.Class.Subtract (Subtract, subtract) where

import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

foreign import nativeSubtract :: forall a. a -> a -> a

class Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract x y = truncate (subtract (toNumber x) (toNumber y))

instance subtractNumber :: Subtract Number where
  subtract = nativeSubtract
