module Neon.Unit
  ( Unit()
  , unit
  ) where

import Neon.Types.Add (Add)
import Neon.Types.And (And)
import Neon.Types.Bounded (Bounded)
import Neon.Types.Compare (Compare)
import Neon.Types.Divide (Divide)
import Neon.Types.Equal (Equal)
import Neon.Types.Multiply (Multiply)
import Neon.Types.Not (Not)
import Neon.Types.One (One)
import Neon.Types.Or (Or)
import Neon.Ordering (Ordering(EqualTo))
import Neon.Types.Show (Show)
import Neon.Types.Subtract (Subtract)
import Neon.Types.Zero (Zero)

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
