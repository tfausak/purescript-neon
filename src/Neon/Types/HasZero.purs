module Neon.Types.HasZero
  ( HasZero
  , zero
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasAdd (HasAdd)

-- | Laws:
-- | - HasIdentity: `zero + x = x + zero = x`
class (HasAdd a) <= HasZero a where
  zero :: a

instance zeroArray :: HasZero (Array a) where
  zero = []

instance zeroBoolean :: HasZero Boolean where
  zero = false

instance zeroFunction :: (HasZero b) => HasZero (a -> b) where
  zero = constant zero

instance zeroInt :: HasZero Int where
  zero = 0

instance zeroNumber :: HasZero Number where
  zero = 0.0

instance zeroString :: HasZero String where
  zero = ""
