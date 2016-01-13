module Neon.Operator where

import Neon.Class.Add (Add, add)
import Neon.Class.And (And, and)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Less (Less, less)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Or (Or, or)
import Neon.Class.Power (Power, power)
import Neon.Class.Remainder (Remainder, remainder)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

infixr 7 ^
infixl 6 *
infixl 6 /
infixl 6 %
infixl 5 +
infixl 5 -
infix  4 ==
infix  4 !=
infix  4 >
infix  4 >=
infix  4 <
infix  4 <=
infixr 3 &&
infixr 2 ||
infixl 1 ..

-- | `power`
(^) :: forall a. (Power a) => a -> a -> a
(^) x y = power y x

-- | `multiply`
(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply y x

-- | `divide`
(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide y x

-- | `remainder`
(%) :: forall a. (Remainder a) => a -> a -> a
(%) x y = remainder y x

-- | `add`
(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add y x

-- | `subtract`
(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract y x

-- | `equal`
(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) x y = equal y x

-- | `notEqual`
(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) x y = notEqual y x

-- | `greater`
(>) :: forall a. (Greater a) => a -> a -> Boolean
(>) x y = greater y x

-- | `greaterOrEqual`
(>=) :: forall a. (Equal a, Greater a) => a -> a -> Boolean
(>=) x y = greaterOrEqual y x

-- | `less`
(<) :: forall a. (Less a) => a -> a -> Boolean
(<) x y = less y x

-- | `lessOrEqual`
(<=) :: forall a. (Equal a, Less a) => a -> a -> Boolean
(<=) x y = lessOrEqual y x

-- | `and`
(&&) :: forall a. (And a) => a -> a -> a
(&&) x y = and y x

-- | `or`
(||) :: forall a. (Or a) => a -> a -> a
(||) x y = or y x

-- | Function application.
-- |
-- | ``` purescript
-- | 1 .. add 2 .. multiply 3 -- 9
-- | ```
(..) :: forall a b. a -> (a -> b) -> b
(..) x f = f x
