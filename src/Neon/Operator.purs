module Neon.Operator where

import Neon.Class.Add (class Add, add)
import Neon.Class.And (class And, and)
import Neon.Class.Compose (class Compose, compose)
import Neon.Class.Divide (class Divide, divide)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Flip (flip)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Identity (identity)
import Neon.Class.Less (class Less, less)
import Neon.Class.Multiply (class Multiply, multiply)
import Neon.Class.Or (class Or, or)
import Neon.Class.Power (class Power, power)
import Neon.Class.Remainder (class Remainder, remainder)
import Neon.Class.Subtract (class Subtract, subtract)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

infixl 8 _compose        as >>
infixr 8 _esopmoc        as <<
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
infixl 1 _apply          as |>
infixr 1 _identity       as <|

_compose :: forall a b c d. (Compose a) => a b c -> a c d -> a b d
_compose = compose

_esopmoc :: forall a b c d. (Compose a) => a c d -> a b c -> a b d
_esopmoc = flip _compose

_power :: forall a. (Power a) => a -> a -> a
_power = power

_multiply :: forall a. (Multiply a) => a -> a -> a
_multiply = multiply

_divide :: forall a. (Divide a) => a -> a -> a
_divide = divide

_remainder :: forall a. (Remainder a) => a -> a -> a
_remainder = remainder

_add :: forall a. (Add a) => a -> a -> a
_add = add

_subtract :: forall a. (Subtract a) => a -> a -> a
_subtract = subtract

_equal :: forall a. (Equal a) => a -> a -> Boolean
_equal = equal

_notEqual :: forall a. (Equal a) => a -> a -> Boolean
_notEqual = notEqual

_greater :: forall a. (Greater a) => a -> a -> Boolean
_greater = greater

_greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
_greaterOrEqual = greaterOrEqual

_less :: forall a. (Less a) => a -> a -> Boolean
_less = less

_lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
_lessOrEqual = lessOrEqual

_and :: forall a. (And a) => a -> a -> a
_and = and

_or :: forall a. (Or a) => a -> a -> a
_or = or

_apply :: forall a b. a -> (a -> b) -> b
_apply x f = f x

_identity :: forall a b. (a -> b) -> a -> b
_identity = identity
