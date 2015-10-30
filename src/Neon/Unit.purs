module Neon.Unit
  ( Unit()
  , unit
  ) where

import Neon.Add (Add)
import Neon.And (And)
import Neon.Bounded (Bounded)
import Neon.Compare (Compare)
import Neon.Divide (Divide)
import Neon.Equal (Equal)
import Neon.Multiply (Multiply)
import Neon.Not (Not)
import Neon.One (One)
import Neon.Or (Or)
import Neon.Ordering (Ordering(EqualTo))
import Neon.Show (Show)
import Neon.Subtract (Subtract)
import Neon.Zero (Zero)

newtype Unit = Unit {}

instance addUnit :: Add Unit where
  add _ _ = unit

instance andUnit :: And Unit where
  and _ _ = unit

instance boundedUnit :: Bounded Unit where
  bottom = unit
  top = unit

instance compareUnit :: Compare Unit where
  compare _ _ = EqualTo

instance divideUnit :: Divide Unit where
  divide _ _ = unit
  modulo _ _ = unit

instance equalUnit :: Equal Unit where
  equal _ _ = true

instance multiplyUnit :: Multiply Unit where
  multiply _ _ = unit

instance notUnit :: Not Unit where
  not _ = unit

instance oneUnit :: One Unit where
  one = unit

instance orUnit :: Or Unit where
  or _ _ = unit

instance showUnit :: Show Unit where
  show _ = "unit"

instance subtractUnit :: Subtract Unit where
  subtract _ _ = unit

instance zeroUnit :: Zero Unit where
  zero = unit

unit :: Unit
unit = Unit {}
