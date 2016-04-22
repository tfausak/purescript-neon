module Neon.Class.HasDivide where

import Prelude as Prelude

class HasDivide a where
  divide :: a -> a -> a

instance intHasDivide :: HasDivide Int where
  divide y x = Prelude.div x y

instance numberHasDivide :: HasDivide Number where
  divide y x = Prelude.div x y
