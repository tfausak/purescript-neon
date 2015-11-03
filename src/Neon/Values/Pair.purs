module Neon.Values.Pair
  ( Pair(Pair)
  , curry
  , pair
  , uncurry
  ) where

import Neon.Types
  ( HasAdd
  , HasAnd
  , IsBounded
  , HasCompare
  , HasDivide
  , HasEqual
  , HasMultiply
  , HasNot
  , HasOne
  , HasOr
  , HasShow
  , HasSubtract
  , HasZero
  , bottom
  , compare
  , not
  , one
  , show
  , top
  , zero
  , (-)
  , (*)
  , (/)
  , (&&)
  , (%)
  , (+)
  , (==)
  , (||)
  )
import Neon.Values.Ordering (Ordering(EqualTo))

-- TODO: purescript/purescript#1595
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasCompose (HasCompose)
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasPure (HasPure)

newtype Pair a b = Pair { first :: a, second :: b }

instance pairHasAdd :: (HasAdd a, HasAdd b) => HasAdd (Pair a b) where
  add (Pair x) (Pair y) = pair (x.first + y.first) (x.second + y.second)

instance pairHasAnd :: (HasAnd a, HasAnd b) => HasAnd (Pair a b) where
  and (Pair x) (Pair y) = pair (x.first && y.first) (x.second && y.second)

instance pairHasApply :: (HasAdd a) => HasApply (Pair a) where
  apply (Pair x) (Pair y) = pair (x.first + y.first) (x.second y.second)

instance pairHasBind :: (HasZero a) => HasBind (Pair a) where
  bind (Pair x) f = case f x.second of
    Pair y -> pair (x.first + y.first) y.second

instance pairHasCompare :: (HasCompare a, HasCompare b) => HasCompare (Pair a b) where
  compare (Pair x) (Pair y) = case compare x.first y.first of
    EqualTo -> compare x.second y.second
    c -> c

instance pairHasCompose :: HasCompose Pair where
  compose (Pair x) (Pair y) = pair x.first y.second

instance pairHasDivide :: (HasDivide a, HasDivide b) => HasDivide (Pair a b) where
  divide (Pair x) (Pair y) = pair (x.first / y.first) (x.second / y.second)
  modulo (Pair x) (Pair y) = pair (x.first % y.first) (x.second % y.second)

instance pairHasEqual :: (HasEqual a, HasEqual b) => HasEqual (Pair a b) where
  equal (Pair x) (Pair y) = x.first == y.first && x.second == y.second

instance pairHasFold :: HasFold (Pair x) where
  foldl f y (Pair x) = f y x.second
  foldr f y (Pair x) = f x.second y

instance pairHasMap :: HasMap (Pair a) where
  map f (Pair x) = pair x.first (f x.second)

instance pairHasMultiply :: (HasMultiply a, HasMultiply b) => HasMultiply (Pair a b) where
  multiply (Pair x) (Pair y) = pair (x.first * y.first) (x.second * y.second)

instance pairHasNot :: (HasNot a, HasNot b) => HasNot (Pair a b) where
  not (Pair x) = pair (not x.first) (not x.second)

instance pairHasOne :: (HasOne a, HasOne b) => HasOne (Pair a b) where
  one = pair one one

instance pairHasOr :: (HasOr a, HasOr b) => HasOr (Pair a b) where
  or (Pair x) (Pair y) = pair (x.first || y.first) (x.second || y.second)

instance pairHasPure :: (HasZero a) => HasPure (Pair a) where
  pure x = pair zero x

instance pairHasShow :: (HasShow a, HasShow b) => HasShow (Pair a b) where
  show (Pair x)
    = "Pair { first: "
    + show x.first
    + ", second: "
    + show x.second + " }"

instance pairHasSubtract :: (HasSubtract a, HasSubtract b) => HasSubtract (Pair a b) where
  subtract (Pair x) (Pair y) = pair (x.first - y.first) (x.second - y.second)

instance pairHasZero :: (HasZero a, HasZero b) => HasZero (Pair a b) where
  zero = pair zero zero

instance pairIsBounded :: (IsBounded a, IsBounded b) => IsBounded (Pair a b) where
  bottom = pair bottom bottom
  top = pair top top

curry :: forall a b c. (Pair a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (pair x y)

pair :: forall a b. a -> b -> Pair a b
pair x y = Pair { first: x, second: y }

uncurry :: forall a b c. (a -> b -> c) -> (Pair a b -> c)
uncurry f = \ (Pair x) -> f x.first x.second
