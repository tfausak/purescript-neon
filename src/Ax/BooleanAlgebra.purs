module Ax.BooleanAlgebra
  ( BooleanAlgebra
  , and
  , not
  , or
  , (&&)
  , (||)
  ) where

import Ax.Bounded (Bounded)

class (Bounded a) <= BooleanAlgebra a where
  and :: a -> a -> a
  not :: a -> a
  or :: a -> a -> a

instance booleanAlgebraBoolean :: BooleanAlgebra Boolean where
  and x y = if x then y else false
  not x = if x then false else true
  or x y = if x then true else y

instance booleanAlgebraFunction :: (BooleanAlgebra b) => BooleanAlgebra (a -> b) where
  and f g = \ x -> f x && g x
  not f = \ x -> not (f x)
  or f g = \ x -> f x || g x

(&&) :: forall a. (BooleanAlgebra a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&

(||) :: forall a. (BooleanAlgebra a) => a -> a -> a
(||) x y = or x y
infixr 2 ||
