module Neon.Class.HasTop where

import Neon.Data as Data
import Neon.Primitive as Primitive
import Prelude as Prelude

-- | Represents types that have an upper bound.
-- |
-- | ``` purescript
-- | top :: Boolean -- true
-- | top :: Char -- '\65535'
-- | ```
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

instance orderingHasTop :: HasTop Data.Ordering where
  top = Prelude.top
