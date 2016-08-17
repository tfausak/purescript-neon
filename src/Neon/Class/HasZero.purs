module Neon.Class.HasZero where

import Data.Set as Set
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that have an additive identity. This is also known as a
-- | [monoid](https://en.wikipedia.org/wiki/Monoid).
-- |
-- | ``` purescript
-- | zero :: Int -- 0
-- | zero :: Number -- 0.0
-- | ```
class HasZero a where
  zero :: a

instance arrayHasZero :: HasZero (Array a) where
  zero = []

instance intHasZero :: HasZero Int where
  zero = Prelude.zero

instance listHasZero :: HasZero (Data.List a) where
  zero = Data.Nil

instance numberHasZero :: HasZero Number where
  zero = Prelude.zero

instance setHasZero :: HasZero (Data.Set a) where
  zero = Set.empty

instance stringHasZero :: HasZero String where
  zero = ""
