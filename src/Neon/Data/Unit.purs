module Neon.Data.Unit (Unit(), unit) where

import Neon.Class.Equal (Equal)
import Neon.Class.Show (Show)

newtype Unit = Unit {}

instance equalUnit :: Equal Unit where
  equal _ _ = true

instance showUnit :: Show Unit where
  show _ = "unit"

unit :: Unit
unit = Unit {}
