module Ax.Or
  ( Or
  , or
  , (||)
  ) where

import Ax.Bounded (Bounded)

class (Bounded a) <= Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or x y = if x then true else y

instance orFunction :: (Or b) => Or (a -> b) where
  or f g = \ x -> f x || g x

(||) :: forall a. (Or a) => a -> a -> a
(||) x y = or x y
infixr 2 ||
