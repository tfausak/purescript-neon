module Neon.Types.HasZero
  ( HasZero
  , zero
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasAdd (HasAdd)

-- | Represents types that have an additive identity. This is also known as a
-- | [monoid](https://en.wikipedia.org/wiki/Monoid).
-- |
-- | Laws:
-- | - Identity: `zero + x = x + zero = x`
class (HasAdd a) <= HasZero a where
  -- | Returns the additive identity value.
  -- |
  -- | ``` purescript
  -- | zero
  -- | -- 0
  -- | ```
  zero :: a

instance arrayHasZero :: HasZero (Array a) where
  zero = []

instance booleanHasZero :: HasZero Boolean where
  zero = false

instance functionHasZero :: (HasZero b) => HasZero (a -> b) where
  zero = always zero

instance intHasZero :: HasZero Int where
  zero = 0

instance numberHasZero :: HasZero Number where
  zero = 0.0

instance stringHasZero :: HasZero String where
  zero = ""
