module Neon.Class.Divide (Divide, divide) where

import Prelude as Prelude

class Divide a where
  divide :: a -> a -> a

instance divideInt :: Divide Int where
  divide y x = x Prelude./ y

instance divideNumber :: Divide Number where
  divide y x = x Prelude./ y
