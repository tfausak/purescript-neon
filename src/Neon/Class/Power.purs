module Neon.Class.Power where

import Neon.Primitive as Primitive
import Math as Math

class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power y x = Primitive.floor
    (power (Primitive.toNumber y) (Primitive.toNumber x))

instance powerNumber :: Power Number where
  power y x = Math.pow x y
