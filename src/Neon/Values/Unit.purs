module Neon.Values.Unit
  ( Unit()
  , unit
  ) where

import Neon.Types.HasAdd (HasAdd)
import Neon.Types.HasAnd (HasAnd)
import Neon.Types.IsBounded (IsBounded)
import Neon.Types.HasCompare (HasCompare)
import Neon.Types.HasDivide (HasDivide)
import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasMultiply (HasMultiply)
import Neon.Types.HasNot (HasNot)
import Neon.Types.HasOne (HasOne)
import Neon.Types.HasOr (HasOr)
import Neon.Values.Ordering (Ordering(EqualTo))
import Neon.Types.HasShow (HasShow)
import Neon.Types.HasSubtract (HasSubtract)
import Neon.Types.HasZero (HasZero)

newtype Unit = Unit {}

instance addUnit :: HasAdd Unit where
  add _ _ = unit

instance andUnit :: HasAnd Unit where
  and _ _ = unit

instance boundedUnit :: IsBounded Unit where
  bottom = unit
  top = unit

instance compareUnit :: HasCompare Unit where
  compare _ _ = EqualTo

instance divideUnit :: HasDivide Unit where
  divide _ _ = unit
  modulo _ _ = unit

instance equalUnit :: HasEqual Unit where
  equal _ _ = true

instance multiplyUnit :: HasMultiply Unit where
  multiply _ _ = unit

instance notUnit :: HasNot Unit where
  not _ = unit

instance oneUnit :: HasOne Unit where
  one = unit

instance orUnit :: HasOr Unit where
  or _ _ = unit

instance showUnit :: HasShow Unit where
  show _ = "unit"

instance subtractUnit :: HasSubtract Unit where
  subtract _ _ = unit

instance zeroUnit :: HasZero Unit where
  zero = unit

unit :: Unit
unit = Unit {}
