module Neon.Operator
  ( (>>)
  , (<<)
  , (^)
  , (*)
  , (/)
  , (%)
  , (+)
  , (-)
  , (==)
  , (!=)
  , (>)
  , (>=)
  , (<)
  , (<=)
  , (&&)
  , (||)
  , (|>)
  , (<|)
  ) where

import Neon.Class.Add (class Add, add)
import Neon.Class.And (class And, and)
import Neon.Class.Compose (class Compose, compose)
import Neon.Class.Divide (class Divide, divide)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Flip (flip)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Less (class Less, less)
import Neon.Class.Multiply (class Multiply, multiply)
import Neon.Class.Or (class Or, or)
import Neon.Class.Power (class Power, power)
import Neon.Class.Remainder (class Remainder, remainder)
import Neon.Class.Subtract (class Subtract, subtract)
import Neon.Helper (greaterOrEqual, lessOrEqual, notEqual)

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
(>>) = compose

(<<) :: forall a b c d. (Compose a) => a c d -> a b c -> a b d
(<<) = flip (>>)

(^) :: forall a. (Power a) => a -> a -> a
(^) = power

(*) :: forall a. (Multiply a) => a -> a -> a
(*) = multiply

(/) :: forall a. (Divide a) => a -> a -> a
(/) = divide

(%) :: forall a. (Remainder a) => a -> a -> a
(%) = remainder

(+) :: forall a. (Add a) => a -> a -> a
(+) = add

(-) :: forall a. (Subtract a) => a -> a -> a
(-) = subtract

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) = equal

(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) = notEqual

(>) :: forall a. (Greater a) => a -> a -> Boolean
(>) = greater

(>=) :: forall a. (Equal a, Greater a) => a -> a -> Boolean
(>=) = greaterOrEqual

(<) :: forall a. (Less a) => a -> a -> Boolean
(<) = less

(<=) :: forall a. (Equal a, Less a) => a -> a -> Boolean
(<=) = lessOrEqual

(&&) :: forall a. (And a) => a -> a -> a
(&&) = and

(||) :: forall a. (Or a) => a -> a -> a
(||) = or

(|>) :: forall a b. a -> (a -> b) -> b
(|>) x f = f x

(<|) :: forall a b. (a -> b) -> a -> b
(<|) = flip (|>)
