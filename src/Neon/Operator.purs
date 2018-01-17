-- | Every operator defined by Neon is in this module. None of them should be
-- | particularly surprising if you're already familiar with JavaScript's
-- | operators.
-- |
-- | ```
-- | Operator | Fixity | Precedence | Description
-- | -------- | ------ | ---------- | -----------
-- | :        | left   | 8          | reverse function application
-- | ^        | right  | 7          | exponentiation
-- | *        | left   | 6          | multiplication
-- | /        | left   | 6          | division
-- | %        | left   | 6          | remainder
-- | +        | left   | 5          | addition
-- | -        | left   | 5          | subtraction
-- | ==       | none   | 4          | equality
-- | !=       | none   | 4          | inequality
-- | >        | none   | 4          | greater than
-- | >=       | none   | 4          | greater than or equal to
-- | <        | none   | 4          | less than
-- | <=       | none   | 4          | less than or equal to
-- | &&       | right  | 3          | and
-- | ||       | right  | 2          | or
-- | ```
-- |
-- | Note that PureScript does not allow exporting an operator (like `+`)
-- | without also exporting the function it's an alias of (like `_add`). The
-- | functions in this module are prefixed with an underscore to imply that
-- | they should not be used directly.
-- |
-- | ``` purescript
-- | _add "ab" "cd" -- bad
-- | add "cd" "ab"  -- confusing
-- | "ab" :add "cd" -- good
-- | "ab" + "cd"    -- better
-- | ```
module Neon.Operator where

import Neon.Class as Class
import Neon.Helper as Helper

-- | Passes an argument to a function. This is reversed function application.
-- | Since every function in Neon takes its "subject" last, it can be useful to
-- | think of this operator like `.` in object-oriented languages.
-- |
-- | ``` purescript
-- | 'a' :toUpper == toUpper 'a' -- "A"
-- | "ab" :add "cd" == add "cd" "ab" -- "abcd"
-- | ```
-- |
-- | This operator has the highest precedence so that it can be combined with
-- | other operators.
-- |
-- | ``` purescript
-- | 1.2 :round + 3 == (1.2 :round) + 3 -- 4
-- | ```
-- |
-- | This operator is left associative. It is designed to be chained together.
-- |
-- | ``` purescript
-- | 'a' :toUpper :add "bc" :add "de" -- "abcde"
-- | ```
infixl 8 _call as :

-- | Raises a number to a power. This is exponentiation, *not* exclusive or
-- | (xor). In some JavaScript implementations, this would be `**`.
-- |
-- | ``` purescript
-- | 2 ^ 3 -- 8
-- | ```
-- |
-- | This operator is right-associative.
-- |
-- | ``` purescript
-- | 4 ^ 3 ^ 2 == 4 ^ (3 ^ 2) -- 262144
-- | ```
infixr 7 _power as ^

-- | Multiplies two numbers together.
-- |
-- | ``` purescript
-- | 2 * 3 -- 6
-- | ```
infixl 6 _multiply as *

-- | Divides a number by another number.
-- |
-- | ``` purescript
-- | 4 / 2 -- 2
-- | 5 / 2 -- 2
-- | 5.0 / 2.0 -- 2.5
-- | ```
infixl 6 _divide as /

-- | Finds the remainder after division.
-- |
-- | ``` purescript
-- | 4 % 2 -- 0
-- | 5 % 2 -- 1
-- | 5.0 % 2.0 -- 1.0
-- | 5.5 % 2.5 -- 0.5
-- | ```
infixl 6 _remainder as %

-- | Adds two numbers together.
-- |
-- | ``` purescript
-- | 2 + 3 -- 5
-- | ```
infixl 5 _add as +

-- | Subtracts one number from another.
-- |
-- | ``` purescript
-- | 3 - 2 -- 1
-- | ```
infixl 5 _subtract as -

-- | Returns `true` if the two things are equal.
-- |
-- | ``` purescript
-- | 2 == 2 -- true
-- | 2 == 3 -- false
-- | ```
infix  4 _equal as ==

-- | Returns `true` if the two things are not equal.
-- |
-- | ``` purescript
-- | 2 != 3 -- true
-- | 2 != 2 -- false
-- | ```
-- |
-- | Note that this is different than the `Prelude`, which uses `/=` for
-- | inequality.
infix  4 _notEqual as !=

-- | Returns `true` if the left argument is greater than the right.
-- |
-- | ``` purescript
-- | 2 > 1 -- true
-- | 2 > 2 -- false
-- | 2 > 3 -- false
-- | ```
infix  4 _greater as >

-- | Returns `true` if the left argument is greater than or equal to the right.
-- |
-- | ``` purescript
-- | 2 >= 1 -- true
-- | 2 >= 2 -- true
-- | 2 >= 3 -- false
-- | ```
infix  4 _greaterOrEqual as >=

-- | Returns `true` if the left argument is less than the right.
-- |
-- | ``` purescript
-- | 2 < 1 -- false
-- | 2 < 2 -- false
-- | 2 < 3 -- true
-- | ```
infix  4 _less as <

-- | Returns `true` if the left argument is less than or equal to the right.
-- |
-- | ``` purescript
-- | 2 <= 1 -- false
-- | 2 <= 2 -- true
-- | 2 <= 3 -- true
-- | ```
infix  4 _lessOrEqual as <=

-- | Returns the logical conjunction of both arguments.
-- |
-- | ``` purescript
-- | true && false -- false
-- | true && true -- true
-- | ```
infixr 3 _and as &&

-- | Returns the logical disjunction of both arguments.
-- |
-- | ``` purescript
-- | false || false -- false
-- | false || true -- true
-- | ```
infixr 2 _or as ||

_call :: forall a b. a -> (a -> b) -> b
_call x f = f x

_power :: forall a. (Class.HasPower a) => a -> a -> a
_power x y = Class.power y x

_multiply :: forall a. (Class.HasMultiply a) => a -> a -> a
_multiply x y = Class.multiply y x

_divide :: forall a. (Class.HasDivide a) => a -> a -> a
_divide x y = Class.divide y x

_remainder :: forall a. (Class.HasRemainder a) => a -> a -> a
_remainder x y = Class.remainder y x

_add :: forall a. (Class.HasAdd a) => a -> a -> a
_add x y = Class.add y x

_subtract :: forall a. (Class.HasSubtract a) => a -> a -> a
_subtract x y = Class.subtract y x

_equal :: forall a. (Class.HasEqual a) => a -> a -> Boolean
_equal x y = Class.equal y x

_notEqual :: forall a. (Class.HasEqual a) => a -> a -> Boolean
_notEqual x y = Helper.notEqual y x

_greater :: forall a. (Class.HasGreater a) => a -> a -> Boolean
_greater x y = Class.greater y x

_greaterOrEqual :: forall a. Class.HasEqual a => Class.HasGreater a => a -> a -> Boolean
_greaterOrEqual x y = Helper.greaterOrEqual y x

_less :: forall a. (Class.HasLess a) => a -> a -> Boolean
_less x y = Class.less y x

_lessOrEqual :: forall a. Class.HasEqual a => Class.HasLess a => a -> a -> Boolean
_lessOrEqual x y = Helper.lessOrEqual y x

_and :: forall a. (Class.HasAnd a) => a -> a -> a
_and x y = Class.and y x

_or :: forall a. (Class.HasOr a) => a -> a -> a
_or x y = Class.or y x
