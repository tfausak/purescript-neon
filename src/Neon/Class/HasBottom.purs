module Neon.Class.HasBottom where

import Neon.Data as Data
import Neon.Primitive as Primitive
import Prelude as Prelude

-- | Represents types that have a lower bound.
-- |
-- | ``` purescript
-- | bottom :: Boolean -- false
-- | bottom :: Char -- '\0'
-- | ```
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

instance orderingHasBottom :: HasBottom Data.Ordering where
  bottom = Prelude.bottom
