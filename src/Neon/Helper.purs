module Neon.Helper
  ( for
  , greaterOrEqual
  , lessOrEqual
  , negate
  , notEqual
  , product
  , reciprocal
  , sum
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Flip (flip)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Less (Less, less)
import Neon.Class.Map (Map, map)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Or (or)
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)

for :: forall a b c. (Map a) => a b -> (b -> c) -> a c
for = flip map

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual x = or (greater x) (equal x)

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual x = or (less x) (equal x)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual = not equal

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product = reduce multiply one

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one

sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum = reduce add zero
