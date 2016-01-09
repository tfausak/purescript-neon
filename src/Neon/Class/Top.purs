module Neon.Class.Top (Top, top) where

import Neon.Primitive.Number (infinity)
import Prelude as Prelude

class Top a where
  top :: a

instance topBoolean :: Top Boolean where
  top = Prelude.top

instance topChar :: Top Char where
  top = Prelude.top

instance topInt :: Top Int where
  top = Prelude.top

instance topNumber :: Top Number where
  top = infinity
