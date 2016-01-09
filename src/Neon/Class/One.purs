module Neon.Class.One (One, one) where

import Prelude as Prelude

class One a where
  one :: a

instance oneInt :: One Int where
  one = Prelude.one

instance oneNumber :: One Number where
  one = Prelude.one
