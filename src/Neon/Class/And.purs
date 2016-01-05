module Neon.Class.And (And, and) where

import Prelude as Prelude

class And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and y x = x Prelude.&& y

instance andFunction :: (And b) => And (a -> b) where
  and g f = \ x -> and (g x) (f x)
