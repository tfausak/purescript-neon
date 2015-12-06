module Neon.Operator
  ( (+)
  , (==)
  , (%)
  , (*)
  , (-)
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Modulo (Modulo, modulo)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Subtract (Subtract, subtract)

infixl 7 *
infixl 7 %
infixl 6 +
infixl 6 -
infix  5 ==

(+) :: forall a. (Add a) => a -> a -> a
(+) = add

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) = equal

(%) :: forall a. (Modulo a) => a -> a -> a
(%) = modulo

(*) :: forall a. (Multiply a) => a -> a -> a
(*) = multiply

(-) :: forall a. (Subtract a) => a -> a -> a
(-) = subtract
