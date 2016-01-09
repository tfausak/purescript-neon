module Neon.Class.Remainder (Remainder, remainder) where

import Prelude as Prelude

class Remainder a where
  remainder :: a -> a -> a

instance remainderInt :: Remainder Int where
  remainder y x = Prelude.mod x y
