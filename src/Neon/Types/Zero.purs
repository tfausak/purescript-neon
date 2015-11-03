module Neon.Types.Zero
  ( Zero
  , zero
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.Add (Add)

-- | Laws:
-- | - Identity: `zero + x = x + zero = x`
class (Add a) <= Zero a where
  zero :: a

instance zeroArray :: Zero (Array a) where
  zero = []

instance zeroBoolean :: Zero Boolean where
  zero = false

instance zeroFunction :: (Zero b) => Zero (a -> b) where
  zero = constant zero

instance zeroInt :: Zero Int where
  zero = 0

instance zeroNumber :: Zero Number where
  zero = 0.0

instance zeroString :: Zero String where
  zero = ""
