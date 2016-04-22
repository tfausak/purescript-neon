module Neon.Class.HasBottom where

import Neon.Primitive as Primitive
import Prelude as Prelude

class HasBottom a where
  bottom :: a

instance booleanHasBottom :: HasBottom Boolean where
  bottom = Prelude.bottom

instance charHasBottom :: HasBottom Char where
  bottom = Prelude.bottom

instance intHasBottom :: HasBottom Int where
  bottom = Prelude.bottom

instance numberHasBottom :: HasBottom Number where
  bottom = Prelude.negate Primitive.infinity
