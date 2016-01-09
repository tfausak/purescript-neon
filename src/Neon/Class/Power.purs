module Neon.Class.Power (Power, power) where

import Math as Math
import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (floor)

class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power y x = floor (power (toNumber y) (toNumber x))

instance powerNumber :: Power Number where
  power y x = Math.pow x y
