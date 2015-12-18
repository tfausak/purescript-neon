module Neon.Class.Root (class Root, root) where

import Neon.Class.Divide (divide)
import Neon.Class.Power (power)
import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

class Root a where
  root :: a -> a -> a

instance rootInt :: Root Int where
  root x y = truncate (root (toNumber x) (toNumber y))

instance rootNumber :: Root Number where
  root x y = power y (divide 1.0 x)
