module Neon.Helper where

import Neon.Class.Equal (Equal, isEqual)
import Neon.Class.Greater (Greater, isGreater)
import Neon.Class.Less (Less, isLess)
import Neon.Class.Not (not)
import Neon.Class.Or (or)

isGreaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
isGreaterOrEqual y x = or (isGreater y x) (isEqual y x)

isLessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
isLessOrEqual y x = or (isLess y x) (isEqual y x)

isNotEqual :: forall a. (Equal a) => a -> a -> Boolean
isNotEqual y x = not (isEqual y x)
