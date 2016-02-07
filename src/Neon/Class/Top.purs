module Neon.Class.Top where

import Global as Global
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
  top = Global.infinity
