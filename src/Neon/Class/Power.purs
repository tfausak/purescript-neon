module Neon.Class.Power (class Power, power) where

import Math (..) as Math
import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (floor)

-- | Represents types that can be exponentiated.
-- |
-- | ``` purescript
-- | power 3 2 -- 8
-- | ```
-- |
-- | Laws:
-- | - `(b ^ n) * (b ^ m) = b ^ (n + m)`
-- | - `(b ^ n) ^ m = b ^ (n * m)`
-- | - `(b * y) ^ n = (b ^ n) * (y ^ n)`
class Power a where
  power :: a -> a -> a

instance powerInt :: Power Int where
  power y x = floor (power (toNumber y) (toNumber x))

instance powerNumber :: Power Number where
  power y x = Math.pow x y
