module Neon.Class.And (class And, and) where

class And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and y x = if x then y else false

instance andFunction :: (And b) => And (a -> b) where
  and f g = \ x -> and (f x) (g x)
