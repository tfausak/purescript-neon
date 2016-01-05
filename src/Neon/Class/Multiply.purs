module Neon.Class.Multiply (Multiply, multiply) where

import Prelude as Prelude

class Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply y x = x Prelude.* y

instance multiplyNumber :: Multiply Number where
  multiply y x = x Prelude.* y
