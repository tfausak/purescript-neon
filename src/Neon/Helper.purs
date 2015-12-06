module Neon.Helper
  ( negate
  , notEqual
  , reciprocal
  ) where

import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual = not equal

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one
