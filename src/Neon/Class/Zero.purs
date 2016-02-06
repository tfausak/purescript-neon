module Neon.Class.Zero (class Zero, zero) where

import Neon.Data (List(Nil))
import Prelude as Prelude

-- | Represents types that have an additive identity. This is also known as a
-- | [monoid](https://en.wikipedia.org/wiki/Monoid).
-- |
-- | ``` purescript
-- | zero :: Int -- 0
-- | zero :: Number -- 0.0
-- | ```
-- |
-- | Laws:
-- | - `zero + x = x + zero = x`
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
