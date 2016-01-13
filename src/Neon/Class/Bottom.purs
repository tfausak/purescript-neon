module Neon.Class.Bottom (class Bottom, bottom) where

import Neon.Primitive.Number (infinity)
import Prelude (..) as Prelude

-- | Represents types that have a lower bound.
-- |
-- | ``` purescript
-- | bottom :: Boolean -- false
-- | bottom :: Char -- '\0'
-- | ```
-- |
-- | Laws:
-- | - `bottom <= x`
class Bottom a where
  bottom :: a

instance bottomBoolean :: Bottom Boolean where
  bottom = Prelude.bottom

instance bottomChar :: Bottom Char where
  bottom = Prelude.bottom

instance bottomInt :: Bottom Int where
  bottom = Prelude.bottom

instance bottomNumber :: Bottom Number where
  bottom = Prelude.negate infinity
