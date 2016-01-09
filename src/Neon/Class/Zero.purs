module Neon.Class.Zero (Zero, zero) where

import Neon.Data (List(Nil))
import Prelude as Prelude

class Zero a where
  zero :: a

instance zeroArray :: Zero (Array a) where
  zero = []

instance zeroInt :: Zero Int where
  zero = Prelude.zero

instance zeroList :: Zero (List a) where
  zero = Nil

instance zeroNumber :: Zero Number where
  zero = Prelude.zero

instance zeroString :: Zero String where
  zero = ""
