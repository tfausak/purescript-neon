module Neon.Types.One
  ( One
  , one
  ) where

import Neon.Types.Multiply (Multiply)

-- | Laws:
-- | - Identity: `one * x = x * one = x`
class (Multiply a) <= One a where
  one :: a

instance oneInt :: One Int where
  one = 1

instance oneNumber :: One Number where
  one = 1.0