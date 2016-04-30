module Neon.Class.HasPower where

import Neon.Primitive as Primitive
import Math as Math

-- | Represents types that can be exponentiated.
-- |
-- | ``` purescript
-- | 2 :power 3 -- 8
-- | ```
class HasPower a where
  power :: a -> a -> a

instance intHasPower :: HasPower Int where
  power y x = Primitive.floor
    (power (Primitive.toNumber y) (Primitive.toNumber x))

instance numberHasPower :: HasPower Number where
  power y x = Math.pow x y
