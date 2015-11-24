module Neon.Values.Identity
  ( Identity(Identity)
  , runIdentity
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAnd (HasAnd, (&&))
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasBottom (HasBottom, bottom)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasDivide (HasDivide, (/), (%))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasMultiply (HasMultiply, (*))
import Neon.Types.HasNot (HasNot, not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasOr (HasOr, (||))
import Neon.Types.HasPure (HasPure)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasSubtract (HasSubtract, (-))
import Neon.Types.HasTop (HasTop, top)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Types.IsEnumerable (IsEnumerable, fromEnum, toEnum, succ, pred)

-- | A simple wrapper. This is most useful as the base of a monad transformer
-- | stack. That means you can use this as an "empty" monad and layer others on
-- | top of it.
newtype Identity a = Identity a

instance identityHasAdd :: (HasAdd a) => HasAdd (Identity a) where
  add (Identity x) (Identity y) = Identity (x + y)

instance identityHasAnd :: (HasAnd a) => HasAnd (Identity a) where
  and (Identity x) (Identity y) = Identity (x && y)

instance identityHasApply :: HasApply Identity where
  apply (Identity f) (Identity x) = Identity (f x)

instance identityHasBind :: HasBind Identity where
  bind (Identity x) f = f x

instance identityHasBottom :: (HasBottom a) => HasBottom (Identity a) where
  bottom = Identity bottom

instance identityHasCompare :: (HasCompare a) => HasCompare (Identity a) where
  compare (Identity x) (Identity y) = compare x y

instance identityHasDivide :: (HasDivide a) => HasDivide (Identity a) where
  divide (Identity x) (Identity y) = Identity (x / y)
  modulo (Identity x) (Identity y) = Identity (x % y)

instance identityHasEqual :: (HasEqual a) => HasEqual (Identity a) where
  equal (Identity x) (Identity y) = x == y

instance identityHasFold :: HasFold Identity where
  foldl f y (Identity x) = f y x
  foldr f y (Identity x) = f x y

instance identityHasMap :: HasMap Identity where
  map f (Identity x) = Identity (f x)

instance identityHasMultiply :: (HasMultiply a) => HasMultiply (Identity a) where
  multiply (Identity x) (Identity y) = Identity (x * y)

instance identityHasNot :: (HasNot a) => HasNot (Identity a) where
  not (Identity x) = Identity (not x)

instance identityHasOne :: (HasOne a) => HasOne (Identity a) where
  one = Identity one

instance identityHasOr :: (HasOr a) => HasOr (Identity a) where
  or (Identity x) (Identity y) = Identity (x || y)

instance identityHasPure :: HasPure Identity where
  pure x = Identity x

instance identityHasShow :: (HasShow a) => HasShow (Identity a) where
  show (Identity x) = "Identity (" + show x + ")"

instance identityHasSubtract :: (HasSubtract a) => HasSubtract (Identity a) where
  subtract (Identity x) (Identity y) = Identity (x - y)

instance identityHasTop :: (HasTop a) => HasTop (Identity a) where
  top = Identity top

instance identityHasZero :: (HasZero a) => HasZero (Identity a) where
  zero = Identity zero

instance identityIsEnumerable :: (IsEnumerable a) => IsEnumerable (Identity a) where
  fromEnum (Identity x) = fromEnum x
  toEnum x = Identity <$> toEnum x
  succ (Identity x) = Identity <$> succ x
  pred (Identity x) = Identity <$> pred x

-- | Extracts the value from its wrapper.
-- |
-- | ``` purescript
-- | runIdentity (Identity unit)
-- | -- unit
-- | ```
runIdentity :: forall a. Identity a -> a
runIdentity (Identity x) = x
