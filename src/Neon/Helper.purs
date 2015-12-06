module Neon.Helper
  ( negate
  , reciprocal
  ) where

import Neon.Class.Divide (Divide, divide)
import Neon.Class.One (One, one)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one
