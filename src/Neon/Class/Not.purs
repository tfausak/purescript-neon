module Neon.Class.Not where

import Prelude as Prelude

class Not a where
  not :: a -> a

instance notBoolean :: Not Boolean where
  not x = Prelude.not x

instance notFunction :: (Not b) => Not (a -> b) where
  not f = \ x -> not (f x)
