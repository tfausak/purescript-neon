module Neon.Operator
  ( (+)
  , (&&)
  , (==)
  , (>)
  , (>=)
  , (<)
  , (<=)
  , (%)
  , (*)
  , (!=)
  , (||)
  , (^)
  , (-)
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.And (And, and)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Less (Less, less)
import Neon.Class.Modulo (Modulo, modulo)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Or (Or, or)
import Neon.Class.Power (Power, power)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

infixr 8 ^
infixl 7 *
infixl 7 %
infixl 6 +
infixl 6 -
infix  4 ==
infix  4 !=
infix  4 >
infix  4 >=
infix  4 <
infix  4 <=
infixr 3 &&
infixr 2 ||

(+) :: forall a. (Add a) => a -> a -> a
(+) = add

(&&) :: forall a. (And a) => a -> a -> a
(&&) = and

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) = equal

(>) :: forall a. (Greater a) => a -> a -> Boolean
(>) = greater

(>=) :: forall a. (Equal a, Greater a) => a -> a -> Boolean
(>=) = greaterOrEqual

(<) :: forall a. (Less a) => a -> a -> Boolean
(<) = less

(<=) :: forall a. (Equal a, Less a) => a -> a -> Boolean
(<=) = lessOrEqual

(%) :: forall a. (Modulo a) => a -> a -> a
(%) = modulo

(*) :: forall a. (Multiply a) => a -> a -> a
(*) = multiply

(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) = notEqual

(||) :: forall a. (Or a) => a -> a -> a
(||) = or

(^) :: forall a. (Power a) => a -> a -> a
(^) = power

(-) :: forall a. (Subtract a) => a -> a -> a
(-) = subtract
