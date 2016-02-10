module Neon.Class.Bottom where

import Neon.Primitive as Primitive
import Prelude as Prelude

class Bottom a where
  bottom :: a

instance bottomBoolean :: Bottom Boolean where
  bottom = Prelude.bottom

instance bottomChar :: Bottom Char where
  bottom = Prelude.bottom

instance bottomInt :: Bottom Int where
  bottom = Prelude.bottom

instance bottomNumber :: Bottom Number where
  bottom = Prelude.negate Primitive.infinity
