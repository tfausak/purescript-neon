module Neon.Class.Negate (Negate, negate) where

import Prelude as Prelude

class Negate a where
  negate :: a -> a

instance negateInt :: Negate Int where
  negate x = Prelude.negate x

instance negateNumber :: Negate Number where
  negate x = Prelude.negate x
