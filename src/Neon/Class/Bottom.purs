module Neon.Class.Bottom (Bottom, bottom) where

import Prelude as Prelude

class Bottom a where
  bottom :: a

instance bottomBoolean :: Bottom Boolean where
  bottom = Prelude.bottom

instance bottomChar :: Bottom Char where
  bottom = Prelude.bottom

instance bottomInt :: Bottom Int where
  bottom = Prelude.bottom
