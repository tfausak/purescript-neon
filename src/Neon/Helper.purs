module Neon.Helper where

import Neon.Class.Equal (Equal, isEqual)
import Neon.Class.Greater (Greater, isGreater)
import Neon.Class.Less (Less, isLess)
import Neon.Class.Map (Map, map)
import Neon.Class.Not (not)
import Neon.Class.Or (or)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Zero (Zero, zero)
import Neon.Data (Unit(), unit)
import Neon.Primitive.Function (always)

asTypeOf :: forall a. a -> a -> a
asTypeOf y x = always x y

isGreaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
isGreaterOrEqual y x = or (isGreater y x) (isEqual y x)

isLessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
isLessOrEqual y x = or (isLess y x) (isEqual y x)

isNotEqual :: forall a. (Equal a) => a -> a -> Boolean
isNotEqual y x = not (isEqual y x)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate x = subtract x zero

void :: forall a b. (Map a) => a b -> a Unit
void x = map (always unit) x
