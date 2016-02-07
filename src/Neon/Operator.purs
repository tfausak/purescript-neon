module Neon.Operator where

import Neon.Class as Class

infixl 8 _call     as :
infixl 6 _multiply as *
infixl 5 _add      as +

_call :: forall a b. a -> (a -> b) -> b
_call x f = f x

_multiply :: forall a. (Class.Multiply a) => a -> a -> a
_multiply x y = Class.multiply y x

_add :: forall a. (Class.Add a) => a -> a -> a
_add x y = Class.add y x
