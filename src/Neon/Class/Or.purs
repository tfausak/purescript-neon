module Neon.Class.Or where

import Data.Int.Bits as Bits
import Prelude as Prelude

class Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or y x = Prelude.disj x y

instance orFunction :: (Or b) => Or (a -> b) where
  or g f = \ x -> or (g x) (f x)

instance orInt :: Or Int where
  or y x = x Bits..|. y
