module Neon.Values.Either
  ( Either(Left, Right)
  ) where

import Neon.Types.HasAdd (HasAdd, add, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, and)
import Neon.Types.HasApply (HasApply, (<*>))
import Neon.Types.HasBind (HasBind, bind)
import Neon.Types.IsBounded (IsBounded, bottom, top)
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

data Either a b
  = Left a
  | Right b

instance addEither :: (HasAdd b) => HasAdd (Either a b) where
  add x y = add <$> x <*> y

instance alternativeEither :: HasAlternative (Either a) where
  alternative (Left _) y = y
  alternative x _ = x

instance andEither :: (IsBounded a, HasAnd b) => HasAnd (Either a b) where
  and x y = and <$> x <*> y

instance applyEither :: HasApply (Either a) where
  apply (Right f) x = f <$> x
  apply (Left x) _ = Left x

instance bindEither :: HasBind (Either a) where
  bind (Left x) _ = Left x
  bind (Right x) f = f x

instance boundedEither :: (IsBounded a, IsBounded b) => IsBounded (Either a b) where
  bottom = Left bottom
  top = Right top

instance compareEither :: (HasCompare a, HasCompare b) => HasCompare (Either a b) where
  compare (Left x) (Left y) = compare x y
  compare (Right x) (Right y) = compare x y
  compare (Left _) _ = LessThan
  compare _ (Left _) = GreaterThan

instance divideEither :: (HasDivide b) => HasDivide (Either a b) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance equalEither :: (HasEqual a, HasEqual b) => HasEqual (Either a b) where
  equal (Left x) (Left y) = x == y
  equal (Right x) (Right y) = x == y
  equal _ _ = false

instance foldEither :: HasFold (Either a) where
  foldl f y x = case x of
    Right r -> f y r
    Left _ -> y
  foldr f y x = case x of
    Right r -> f r y
    Left _ -> y

instance mapEither :: HasMap (Either a) where
  map f (Right x) = Right (f x)
  map _ (Left x) = Left x

instance multiplyEither :: (HasMultiply b) => HasMultiply (Either a b) where
  multiply x y = multiply <$> x <*> y

instance notEither :: (IsBounded a, HasNot b) => HasNot (Either a b) where
  not x = not <$> x

instance oneEither :: (HasOne b) => HasOne (Either a b) where
  one = Right one

instance orEither :: (IsBounded a, HasOr b) => HasOr (Either a b) where
  or x y = or <$> x <*> y

instance pureEither :: HasPure (Either a) where
  pure x = Right x

instance showEither :: (HasShow a, HasShow b) => HasShow (Either a b) where
  show (Left x) = "Left (" + show x + ")"
  show (Right x) = "Right (" + show x + ")"

instance subtractEither :: (HasSubtract b) => HasSubtract (Either a b) where
  subtract x y = subtract <$> x <*> y

instance zeroEither :: (HasZero b) => HasZero (Either a b) where
  zero = Right zero
