module Neon.Class.Or (class Or, or) where

class Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or y x = if x then true else y

instance orFunction :: (Or b) => Or (a -> b) where
  or f g = \ x -> or (f x) (g x)
