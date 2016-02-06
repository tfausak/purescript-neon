module Neon.Class.Top where

import Neon.Primitive as Primitive
import Prelude as Prelude

-- | Represents types that have an upper bound.
-- |
-- | ``` purescript
-- | top :: Boolean -- true
-- | top :: Char -- '\65535'
-- | ```
-- |
-- | Laws:
-- | - `top >= x`
class Top a where
  top :: a

instance topBoolean :: Top Boolean where
  top = Prelude.top

instance topChar :: Top Char where
  top = Prelude.top

instance topInt :: Top Int where
  top = Prelude.top

instance topNumber :: Top Number where
  top = Primitive.infinity
