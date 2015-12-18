module Neon.Class.Power (class Power, power) where

import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

foreign import nativePower :: forall a. a -> a -> a

class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power x y = truncate (power (toNumber x) (toNumber y))

instance powerNumber :: Power Number where
  power = nativePower
