module Neon.Class.Multiply where

import Prelude as Prelude

class Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply y x = Prelude.mul x y

instance multiplyNumber :: Multiply Number where
  multiply y x = Prelude.mul x y
