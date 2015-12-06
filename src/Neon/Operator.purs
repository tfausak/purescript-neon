module Neon.Operator
  ( (+)
  , (==)
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.Equal (Equal, equal)

infixl 6 +
infix  5 ==

(+) :: forall a. (Add a) => a -> a -> a
(+) = add

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) = equal
