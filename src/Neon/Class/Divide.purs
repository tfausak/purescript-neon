module Neon.Class.Divide where

import Prelude as Prelude

class Divide a where
  divide :: a -> a -> a

instance divideInt :: Divide Int where
  divide y x = Prelude.div x y

instance divideNumber :: Divide Number where
  divide y x = Prelude.div x y
