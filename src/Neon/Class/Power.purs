module Neon.Class.Power (Power, power) where

import Data.Int as Int
import Math as Math

class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power y x = Int.floor (Math.pow (Int.toNumber x) (Int.toNumber y))

instance powerNumber :: Power Number where
  power y x = Math.pow x y
