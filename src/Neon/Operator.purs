module Neon.Operator
  ( (+)
  , (==)
  , (-)
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Subtract (Subtract, subtract)

infixl 6 +
infixl 6 -
infix  5 ==

(+) :: forall a. (Add a) => a -> a -> a
(+) = add

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) = equal

(-) :: forall a. (Subtract a) => a -> a -> a
(-) = subtract
