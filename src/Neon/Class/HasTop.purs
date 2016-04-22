module Neon.Class.HasTop where

import Neon.Primitive as Primitive
import Prelude as Prelude

class HasTop a where
  top :: a

instance booleanHasTop :: HasTop Boolean where
  top = Prelude.top

instance charHasTop :: HasTop Char where
  top = Prelude.top

instance intHasTop :: HasTop Int where
  top = Prelude.top

instance numberHasTop :: HasTop Number where
  top = Primitive.infinity
