module Neon.Class.HasMultiply where

import Prelude as Prelude

class HasMultiply a where
  multiply :: a -> a -> a

instance intHasMultiply :: HasMultiply Int where
  multiply y x = Prelude.mul x y

instance numberHasMultiply :: HasMultiply Number where
  multiply y x = Prelude.mul x y
