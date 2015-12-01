module Neon.Values.Constant
  ( Constant(Constant)
  , runConstant
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, (&&))
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasBottom (HasBottom, bottom)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasDivide (HasDivide, (/), (%))
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasMultiply (HasMultiply, (*))
import Neon.Types.HasNot (HasNot, not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasOr (HasOr, (||))
import Neon.Types.HasPower (HasPower, (^))
import Neon.Types.HasPure (HasPure)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasSubtract (HasSubtract, (-))
import Neon.Types.HasTop (HasTop, top)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Types.IsEnumerable (IsEnumerable, fromEnum, toEnum, succ, pred)

-- | A wrapper that ignores its second type argument.
newtype Constant a b = Constant a

instance constantHasAdd :: (HasAdd a) => HasAdd (Constant a b) where
  add (Constant x) (Constant y) = Constant (x + y)

instance constantHasAlternative :: (HasAdd a) => HasAlternative (Constant a) where
  alternative (Constant x) (Constant y) = Constant (x + y)

instance constantHasAnd :: (HasAnd a) => HasAnd (Constant a b) where
  and (Constant x) (Constant y) = Constant (x && y)

instance constantHasApply :: (HasAdd a) => HasApply (Constant a) where
  apply (Constant x) (Constant y) = Constant (x + y)

instance constantHasBind :: (HasZero a) => HasBind (Constant a) where
  bind (Constant x) _ = Constant x

instance constantHasBottom :: (HasBottom a) => HasBottom (Constant a b) where
  bottom = Constant bottom

instance constantHasCompare :: (HasCompare a) => HasCompare (Constant a b) where
  compare (Constant x) (Constant y) = compare x y

instance constantHasDivide :: (HasDivide a) => HasDivide (Constant a b) where
  divide (Constant x) (Constant y) = Constant (x / y)
  modulo (Constant x) (Constant y) = Constant (x % y)

instance constantHasEmpty :: (HasZero a) => HasEmpty (Constant a) where
  empty = Constant zero

instance constantHasEqual :: (HasEqual a) => HasEqual (Constant a b) where
  equal (Constant x) (Constant y) = x == y

instance constantHasFold :: HasFold (Constant a) where
  foldl _ x _ = x
  foldr _ x _ = x

instance constantHasMap :: HasMap (Constant a) where
  map _ (Constant x) = Constant x

instance constantHasMultiply :: (HasMultiply a) => HasMultiply (Constant a b) where
  multiply (Constant x) (Constant y) = Constant (x * y)

instance constantHasNot :: (HasNot a) => HasNot (Constant a b) where
  not (Constant x) = Constant (not x)

instance constantHasOne :: (HasOne a) => HasOne (Constant a b) where
  one = Constant one

instance constantHasOr :: (HasOr a) => HasOr (Constant a b) where
  or (Constant x) (Constant y) = Constant (x || y)

instance constantHasPower :: (HasPower a) => HasPower (Constant a b) where
  power (Constant x) (Constant y) = Constant (x ^ y)

instance constantHasPure :: (HasZero a) => HasPure (Constant a) where
  pure _ = Constant zero

instance constantHasShow :: (HasShow a) => HasShow (Constant a b) where
  show (Constant x) = "Constant (" + show x + ")"

instance constantHasSubtract :: (HasSubtract a) => HasSubtract (Constant a b) where
  subtract (Constant x) (Constant y) = Constant (x - y)

instance constantHasTop :: (HasTop a) => HasTop (Constant a b) where
  top = Constant top

instance constantHasZero :: (HasZero a) => HasZero (Constant a b) where
  zero = Constant zero

instance constantIsEnumerable :: (IsEnumerable a) => IsEnumerable (Constant a b) where
  fromEnum (Constant x) = fromEnum x
  toEnum x = map Constant (toEnum x)
  succ (Constant x) = map Constant (succ x)
  pred (Constant x) = map Constant (pred x)

-- | Extracts the value from its wrapper.
-- |
-- | ``` purescript
-- | runConstant (Constant unit)
-- | -- unit
-- | ```
runConstant :: forall a b. Constant a b -> a
runConstant (Constant x) = x
