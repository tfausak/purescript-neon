module Neon.Helper where

import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Less (class Less, less)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Negate (negate)
import Neon.Class.Or (or)

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual = or greater equal

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual = or less equal

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual = negate equal
