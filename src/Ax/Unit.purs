module Ax.Unit
  ( Unit()
  , unit
  ) where

import Ax.Add (Add)
import Ax.And (And)
import Ax.Bounded (Bounded)
import Ax.Compare (Compare)
import Ax.Divide (Divide)
import Ax.Equal (Equal)
import Ax.Multiply (Multiply)
import Ax.Not (Not)
import Ax.One (One)
import Ax.Or (Or)
import Ax.Ordering (Ordering(EqualTo))
import Ax.Show (Show)
import Ax.Subtract (Subtract)
import Ax.Zero (Zero)

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
