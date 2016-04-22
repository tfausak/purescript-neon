module Neon.Class.HasOne where

import Prelude as Prelude

class HasOne a where
  one :: a

instance intHasOne :: HasOne Int where
  one = Prelude.one

instance numberHasOne :: HasOne Number where
  one = Prelude.one
