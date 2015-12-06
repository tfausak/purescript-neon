module Neon.Class.Power (Power, power) where

foreign import nativePower :: forall a. a -> a -> a

class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power = nativePower

instance powerNumber :: Power Number where
  power = nativePower
