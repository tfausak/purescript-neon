module Neon.Class.Subtract (Subtract, subtract) where

import Prelude as Prelude

class Subtract a where
  subtract :: a -> a -> a

instance subtractInt :: Subtract Int where
  subtract y x = x Prelude.- y

instance subtractNumber :: Subtract Number where
  subtract y x = x Prelude.- y
