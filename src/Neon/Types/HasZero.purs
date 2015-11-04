module Neon.Types.HasZero
  ( HasZero
  , zero
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasAdd (HasAdd)

-- | Laws:
-- | - Identity: `zero + x = x + zero = x`
class (HasAdd a) <= HasZero a where
  zero :: a

instance arrayHasZero :: HasZero (Array a) where
  zero = []

instance booleanHasZero :: HasZero Boolean where
  zero = false

instance functionHasZero :: (HasZero b) => HasZero (a -> b) where
  zero = constant zero

instance intHasZero :: HasZero Int where
  zero = 0

instance numberHasZero :: HasZero Number where
  zero = 0.0

instance stringHasZero :: HasZero String where
  zero = ""
