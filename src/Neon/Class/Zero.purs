module Neon.Class.Zero (Zero, zero) where

import Prelude as Prelude

class Zero a where
  zero :: a

instance zeroArray :: Zero (Array a) where
  zero = []

instance zeroInt :: Zero Int where
  zero = Prelude.zero

instance zeroNumber :: Zero Number where
  zero = Prelude.zero

instance zeroString :: Zero String where
  zero = ""
