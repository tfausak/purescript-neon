module Neon.Values.Maybe
  ( Maybe(Nothing, Just)
  ) where

import Neon.Types.HasAdd (HasAdd, add, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, and)
import Neon.Types.HasApply (HasApply, (<*>))
import Neon.Types.HasBind (HasBind, bind)
import Neon.Types.Bounded (Bounded, top)
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

instance addMaybe :: (HasAdd a) => HasAdd (Maybe a) where
  add x y = add <$> x <*> y

instance alternativeMaybe :: HasAlternative Maybe where
  alternative Nothing y = y
  alternative x _ = x

instance andMaybe :: (HasAnd a) => HasAnd (Maybe a) where
  and x y = and <$> x <*> y

instance applyMaybe :: HasApply Maybe where
  apply (Just f) x = f <$> x
  apply _ _ = Nothing

instance bindMaybe :: HasBind Maybe where
  bind Nothing _ = Nothing
  bind (Just x) f = f x

instance boundedMaybe :: (Bounded a) => Bounded (Maybe a) where
  bottom = Nothing
  top = Just top

instance compareMaybe :: (HasCompare a) => HasCompare (Maybe a) where
  compare (Just x) (Just y) = compare x y
  compare Nothing Nothing = EqualTo
  compare Nothing _ = LessThan
  compare _ Nothing = GreaterThan

instance divideMaybe :: (HasDivide a) => HasDivide (Maybe a) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance emptyMaybe :: HasEmpty Maybe where
  empty = Nothing

instance equalMaybe :: (HasEqual a) => HasEqual (Maybe a) where
  equal Nothing Nothing = true
  equal (Just x) (Just y) = x == y
  equal _ _ = false

instance foldMaybe :: HasFold Maybe where
  foldl f y x = case x of
    Just j -> f y j
    Nothing -> y
  foldr f y x = case x of
    Just j -> f j y
    Nothing -> y

instance mapMaybe :: HasMap Maybe where
  map _ Nothing = Nothing
  map f (Just x) = Just (f x)

instance multiplyMaybe :: (HasMultiply a) => HasMultiply (Maybe a) where
  multiply x y = multiply <$> x <*> y

instance notMaybe :: (HasNot a) => HasNot (Maybe a) where
  not x = not <$> x

instance oneMaybe :: (HasOne a) => HasOne (Maybe a) where
  one = Just one

instance orMaybe :: (HasOr a) => HasOr (Maybe a) where
  or x y = or <$> x <*> y

instance pureMaybe :: HasPure Maybe where
  pure x = Just x

instance showMaybe :: (HasShow a) => HasShow (Maybe a) where
  show Nothing = "Nothing"
  show (Just x) = "Just (" + show x + ")"

instance subtractMaybe :: (HasSubtract a) => HasSubtract (Maybe a) where
  subtract x y = subtract <$> x <*> y

instance zeroMaybe :: (HasZero a) => HasZero (Maybe a) where
  zero = Just zero
