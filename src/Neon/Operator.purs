module Neon.Operator where

import Neon.Class.And (class And, and)
import Neon.Class.DividedBy (class DividedBy, dividedBy)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Less (class Less, less)
import Neon.Class.Minus (class Minus, minus)
import Neon.Class.Modulo (class Modulo, modulo)
import Neon.Class.Or (class Or, or)
import Neon.Class.Plus (class Plus, plus)
import Neon.Class.Times (class Times, times)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

infixl 6 _times          as *
infixl 6 _dividedBy      as /
infixl 6 _modulo         as %
infixl 5 _plus           as +
infixl 5 _minus          as -
infix  4 _equal          as ==
infix  4 _notEqual       as !=
infix  4 _greater        as >
infix  4 _greaterOrEqual as >=
infix  4 _less           as <
infix  4 _lessOrEqual    as <=
infixr 3 _and            as &&
infixr 2 _or             as ||
infixl 1 _apply          as :

_times :: forall a. (Times a) => a -> a -> a
_times x y = times y x

_dividedBy :: forall a. (DividedBy a) => a -> a -> a
_dividedBy x y = dividedBy y x

_plus :: forall a. (Plus a) => a -> a -> a
_plus x y = plus y x

_minus :: forall a. (Minus a) => a -> a -> a
_minus x y = minus y x

_modulo :: forall a. (Modulo a) => a -> a -> a
_modulo x y = modulo y x

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
