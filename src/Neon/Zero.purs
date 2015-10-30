module Neon.Zero
  ( Zero
  , zero
  ) where

import Neon.Add (Add)

class (Add a) <= Zero a where
  zero :: a

instance zeroArray :: Zero (Array a) where
  zero = []

instance zeroInt :: Zero Int where
  zero = 0

instance zeroNumber :: Zero Number where
  zero = 0.0

instance zeroString :: Zero String where
  zero = ""
