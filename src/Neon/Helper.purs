module Neon.Helper
  ( negate
  ) where

import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero
