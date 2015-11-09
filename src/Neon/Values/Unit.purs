module Neon.Values.Unit
  ( Unit()
  , unit
  ) where

import Neon.Types.HasAdd (HasAdd)
import Neon.Types.HasAnd (HasAnd)
import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasCompare (HasCompare)
import Neon.Types.HasDivide (HasDivide)
import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasMultiply (HasMultiply)
import Neon.Types.HasNot (HasNot)
import Neon.Types.HasOne (HasOne)
import Neon.Types.HasOr (HasOr)
import Neon.Types.HasShow (HasShow)
import Neon.Types.HasSubtract (HasSubtract)
import Neon.Types.HasTop (HasTop)
import Neon.Types.HasZero (HasZero)
import Neon.Types.IsBounded (IsBounded)
import Neon.Values.Ordering (Ordering(EqualTo))

newtype Unit = Unit {}

instance unitHasAdd :: HasAdd Unit where
  add _ _ = unit

instance unitHasAnd :: HasAnd Unit where
  and _ _ = unit

instance unitHasBottom :: HasBottom Unit where
  bottom = unit

instance unitHasCompare :: HasCompare Unit where
  compare _ _ = EqualTo

instance unitHasDivide :: HasDivide Unit where
  divide _ _ = unit
  modulo _ _ = unit

instance unitHasEqual :: HasEqual Unit where
  equal _ _ = true

instance unitHasMultiply :: HasMultiply Unit where
  multiply _ _ = unit

instance unitHasNot :: HasNot Unit where
  not _ = unit

instance unitHasOne :: HasOne Unit where
  one = unit

instance unitHasOr :: HasOr Unit where
  or _ _ = unit

instance unitHasShow :: HasShow Unit where
  show _ = "unit"

instance unitHasSubtract :: HasSubtract Unit where
  subtract _ _ = unit

instance unitHasZero :: HasZero Unit where
  zero = unit

instance unitHastop :: HasTop Unit where
  top = unit

instance unitIsBounded :: IsBounded Unit

unit :: Unit
unit = Unit {}
