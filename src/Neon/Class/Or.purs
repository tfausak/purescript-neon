module Neon.Class.Or (Or, or) where

import Prelude as Prelude

class Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or y x = Prelude.disj x y

instance orFunction :: (Or b) => Or (a -> b) where
  or g f = \ x -> or (g x) (f x)
