module Neon.Helper
  ( greaterOrEqual
  , lessOrEqual
  , negate
  , notEqual
  , reciprocal
  ) where

import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Less (Less, less)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Or (or)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual x = or (greater x) (equal x)

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual x = or (less x) (equal x)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual = not equal

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one
