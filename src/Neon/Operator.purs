module Neon.Operator where

import Neon.Class.Add (Add, add)
import Neon.Class.And (And, and)
import Neon.Class.Compose (Compose, compose)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, isEqual)
import Neon.Class.Greater (Greater, isGreater)
import Neon.Class.Less (Less, isLess)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Or (Or, or)
import Neon.Class.Power (Power, power)
import Neon.Class.Remainder (Remainder, remainder)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Helper (isGreaterOrEqual, isLessOrEqual, isNotEqual)

infixl 8 >>
infixr 8 <<
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
infixl 1 |>
infixr 1 <|

(>>) :: forall a b c d. (Compose a) => a b c -> a c d -> a b d
(>>) f g = compose g f

(<<) :: forall a b c d. (Compose a) => a c d -> a b c -> a b d
(<<) f g = compose f g

(^) :: forall a. (Power a) => a -> a -> a
(^) x y = power y x

(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply y x

(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide y x

(%) :: forall a. (Remainder a) => a -> a -> a
(%) x y = remainder y x

(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add y x

(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract y x

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) x y = isEqual y x

(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) x y = isNotEqual y x

(>) :: forall a. (Greater a) => a -> a -> Boolean
(>) x y = isGreater y x

(>=) :: forall a. (Equal a, Greater a) => a -> a -> Boolean
(>=) x y = isGreaterOrEqual y x

(<) :: forall a. (Less a) => a -> a -> Boolean
(<) x y = isLess y x

(<=) :: forall a. (Equal a, Less a) => a -> a -> Boolean
(<=) x y = isLessOrEqual y x

(&&) :: forall a. (And a) => a -> a -> a
(&&) x y = and y x

(||) :: forall a. (Or a) => a -> a -> a
(||) x y = or y x

(|>) :: forall a b. a -> (a -> b) -> b
(|>) x f = f x

(<|) :: forall a b. (a -> b) -> a -> b
(<|) f x = f x
