module Neon.Operator where

import Neon.Class as Class
import Neon.Helper as Helper

infixl 8 _dot            as :
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

_dot :: forall a b. a -> (a -> b) -> b
_dot x f = f x

_power :: forall a. (Class.Power a) => a -> a -> a
_power y x = Class.power x y

_multiply :: forall a. (Class.Multiply a) => a -> a -> a
_multiply x y = Class.multiply y x

_divide :: forall a. (Class.Divide a) => a -> a -> a
_divide x y = Class.divide y x

_remainder :: forall a. (Class.Remainder a) => a -> a -> a
_remainder x y = Class.remainder y x

_add :: forall a. (Class.Add a) => a -> a -> a
_add x y = Class.add y x

_subtract :: forall a. (Class.Subtract a) => a -> a -> a
_subtract x y = Class.subtract y x

_equal :: forall a. (Class.Equal a) => a -> a -> Boolean
_equal x y = Class.equal y x

_notEqual :: forall a. (Class.Equal a) => a -> a -> Boolean
_notEqual x y = Helper.notEqual y x

_greater :: forall a. (Class.Greater a) => a -> a -> Boolean
_greater x y = Class.greater y x

_greaterOrEqual :: forall a. (Class.Equal a, Class.Greater a) => a -> a -> Boolean
_greaterOrEqual x y = Helper.greaterOrEqual y x

_less :: forall a. (Class.Less a) => a -> a -> Boolean
_less x y = Class.less y x

_lessOrEqual :: forall a. (Class.Equal a, Class.Less a) => a -> a -> Boolean
_lessOrEqual x y = Helper.lessOrEqual y x

_and :: forall a. (Class.And a) => a -> a -> a
_and x y = Class.and y x

_or :: forall a. (Class.Or a) => a -> a -> a
_or x y = Class.or y x
