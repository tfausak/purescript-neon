module Neon.One
  ( One
  , one
  ) where

import Neon.Multiply (Multiply)

class (Multiply a) <= One a where
  one :: a

instance oneInt :: One Int where
  one = 1

instance oneNumber :: One Number where
  one = 1.0
