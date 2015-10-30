module Ax.And
  ( And
  , and
  , (&&)
  ) where

import Ax.Bounded (Bounded)

class (Bounded a) <= And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and x y = if x then y else false

instance andFunction :: (And b) => And (a -> b) where
  and f g = \ x -> f x && g x

(&&) :: forall a. (And a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&