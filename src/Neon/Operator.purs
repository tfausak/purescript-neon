module Neon.Operator where

import Neon.Class.Add (class Add, add)
import Neon.Class.And (class And, and)
import Neon.Class.Divide (class Divide, divide)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Less (class Less, less)
import Neon.Class.Multiply (class Multiply, multiply)
import Neon.Class.Or (class Or, or)
import Neon.Class.Power (class Power, power)
import Neon.Class.Remainder (class Remainder, remainder)
import Neon.Class.Subtract (class Subtract, subtract)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

infixr 7 _power          as ^
infixl 6 _multiply       as *
infixl 6 _divide         as /
infixl 6 _remainder      as %
infixl 5 _add            as +
infixl 5 _subtract       as -
infix  4 _equal          as ==
infix  4 _notEqual       as !=
infix  4 _greater        as >
infix  4 _greaterOrEqual as >=
infix  4 _less           as <
infix  4 _lessOrEqual    as <=
infixr 3 _and            as &&
infixr 2 _or             as ||
infixl 1 _apply          as ..

_power :: forall a. (Power a) => a -> a -> a
_power y x = power x y

_multiply :: forall a. (Multiply a) => a -> a -> a
_multiply x y = multiply y x

_divide :: forall a. (Divide a) => a -> a -> a
_divide x y = divide y x

_remainder :: forall a. (Remainder a) => a -> a -> a
_remainder x y = remainder y x

_add :: forall a. (Add a) => a -> a -> a
_add x y = add y x

_subtract :: forall a. (Subtract a) => a -> a -> a
_subtract x y = subtract y x

_equal :: forall a. (Equal a) => a -> a -> Boolean
_equal x y = equal y x

_notEqual :: forall a. (Equal a) => a -> a -> Boolean
_notEqual x y = notEqual y x

_greater :: forall a. (Greater a) => a -> a -> Boolean
_greater x y = greater y x

_greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
_greaterOrEqual x y = greaterOrEqual y x

_less :: forall a. (Less a) => a -> a -> Boolean
_less x y = less y x

_lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
_lessOrEqual x y = lessOrEqual y x

_and :: forall a. (And a) => a -> a -> a
_and x y = and y x

_or :: forall a. (Or a) => a -> a -> a
_or x y = or y x

_apply :: forall a b. a -> (a -> b) -> b
_apply x f = f x
