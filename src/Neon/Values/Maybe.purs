module Neon.Values.Maybe
  ( Maybe(Nothing, Just)
  ) where

import Neon.Types.HasAdd (HasAdd, add, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, and)
import Neon.Types.HasApply (HasApply, (<*>))
import Neon.Types.HasBind (HasBind, bind)
import Neon.Types.IsBounded (IsBounded, top)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasDivide (HasDivide, divide, modulo)
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasMultiply (HasMultiply, multiply)
import Neon.Types.HasNot (HasNot, not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasOr (HasOr, or)
import Neon.Types.HasPure (HasPure)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasSubtract (HasSubtract, subtract)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

data Maybe a
  = Nothing
  | Just a

instance maybeHasAdd :: (HasAdd a) => HasAdd (Maybe a) where
  add x y = add <$> x <*> y

instance maybeHasAlternative :: HasAlternative Maybe where
  alternative Nothing y = y
  alternative x _ = x

instance maybeHasAnd :: (HasAnd a) => HasAnd (Maybe a) where
  and x y = and <$> x <*> y

instance maybeHasApply :: HasApply Maybe where
  apply (Just f) x = f <$> x
  apply _ _ = Nothing

instance maybeHasBind :: HasBind Maybe where
  bind Nothing _ = Nothing
  bind (Just x) f = f x

instance maybeHasCompare :: (HasCompare a) => HasCompare (Maybe a) where
  compare (Just x) (Just y) = compare x y
  compare Nothing Nothing = EqualTo
  compare Nothing _ = LessThan
  compare _ Nothing = GreaterThan

instance maybeHasDivide :: (HasDivide a) => HasDivide (Maybe a) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance maybeHasEmpty :: HasEmpty Maybe where
  empty = Nothing

instance maybeHasEqual :: (HasEqual a) => HasEqual (Maybe a) where
  equal Nothing Nothing = true
  equal (Just x) (Just y) = x == y
  equal _ _ = false

instance maybeHasFold :: HasFold Maybe where
  foldl f y x = case x of
    Just j -> f y j
    Nothing -> y
  foldr f y x = case x of
    Just j -> f j y
    Nothing -> y

instance maybeHasMap :: HasMap Maybe where
  map _ Nothing = Nothing
  map f (Just x) = Just (f x)

instance maybeHasMultiply :: (HasMultiply a) => HasMultiply (Maybe a) where
  multiply x y = multiply <$> x <*> y

instance maybeHasNot :: (HasNot a) => HasNot (Maybe a) where
  not x = not <$> x

instance maybeHasOne :: (HasOne a) => HasOne (Maybe a) where
  one = Just one

instance maybeHasOr :: (HasOr a) => HasOr (Maybe a) where
  or x y = or <$> x <*> y

instance maybeHasPure :: HasPure Maybe where
  pure x = Just x

instance maybeHasShow :: (HasShow a) => HasShow (Maybe a) where
  show Nothing = "Nothing"
  show (Just x) = "Just (" + show x + ")"

instance maybeHasSubtract :: (HasSubtract a) => HasSubtract (Maybe a) where
  subtract x y = subtract <$> x <*> y

instance maybeHasZero :: (HasZero a) => HasZero (Maybe a) where
  zero = Just zero

instance maybeIsBounded :: (IsBounded a) => IsBounded (Maybe a) where
  bottom = Nothing
  top = Just top
