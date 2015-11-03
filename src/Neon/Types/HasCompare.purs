module Neon.Types.HasCompare
  ( HasCompare
  , compare
  , greaterThan
  , greaterThanOrEqualTo
  , lessThan
  , lessThanOrEqualTo
  , (<)
  , (<=)
  , (>)
  , (>=)
  ) where

import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

foreign import nativeCompareArray :: forall a. (HasCompare a) => Ordering -> Ordering -> Ordering -> (a -> a -> Ordering) -> Array a -> Array a -> Ordering
foreign import nativeCompareChar :: Ordering -> Ordering -> Ordering -> Char -> Char -> Ordering
foreign import nativeCompareInt :: Ordering -> Ordering -> Ordering -> Int -> Int -> Ordering
foreign import nativeCompareNumber :: Ordering -> Ordering -> Ordering -> Number -> Number -> Ordering
foreign import nativeCompareString :: Ordering -> Ordering -> Ordering -> String -> String -> Ordering

-- | Laws:
-- | - Reflexivity: `a <= a`
-- | - Antisymmetry: if `a <= b` and `b <= a` then `a = b`
-- | - Transitivity: if `a <= b` and `b <= c` then `a <= c`
class (HasEqual a) <= HasCompare a where
  compare :: a -> a -> Ordering

instance arrayHasCompare :: (HasCompare a) => HasCompare (Array a) where
  compare x y = nativeCompareArray LessThan EqualTo GreaterThan compare x y

instance booleanHasCompare :: HasCompare Boolean where
  compare x y = if x == y
    then EqualTo
    else case x of
      true -> GreaterThan
      false -> LessThan

instance charHasCompare :: HasCompare Char where
  compare x y = nativeCompareChar LessThan EqualTo GreaterThan x y

instance intHasCompare :: HasCompare Int where
  compare x y = nativeCompareInt LessThan EqualTo GreaterThan x y

instance numberHasCompare :: HasCompare Number where
  compare x y = nativeCompareNumber LessThan EqualTo GreaterThan x y

instance orderingHasCompare :: HasCompare Ordering where
  compare x y = case x of
    LessThan -> case y of
      LessThan -> EqualTo
      _ -> LessThan
    EqualTo -> case y of
      LessThan -> GreaterThan
      EqualTo -> EqualTo
      GreaterThan -> LessThan
    GreaterThan -> case y of
      GreaterThan -> EqualTo
      _ -> GreaterThan

instance stringHasCompare :: HasCompare String where
  compare x y = nativeCompareString LessThan EqualTo GreaterThan x y

greaterThan :: forall a. (HasCompare a) => a -> a -> Boolean
greaterThan x y = case compare x y of
  GreaterThan -> true
  _ -> false

greaterThanOrEqualTo :: forall a. (HasCompare a) => a -> a -> Boolean
greaterThanOrEqualTo x y = case compare x y of
  LessThan -> false
  _ -> true

lessThan :: forall a. (HasCompare a) => a -> a -> Boolean
lessThan x y = case compare x y of
  LessThan -> true
  _ -> false

lessThanOrEqualTo :: forall a. (HasCompare a) => a -> a -> Boolean
lessThanOrEqualTo x y = case compare x y of
  GreaterThan -> false
  _ -> true

-- | Alias for `lessThan`.
(<) :: forall a. (HasCompare a) => a -> a -> Boolean
(<) x y = lessThan x y
infixl 4 <

-- | Alias for `lessThanOrEqualTo`.
(<=) :: forall a. (HasCompare a) => a -> a -> Boolean
(<=) x y = lessThanOrEqualTo x y
infixl 4 <=

-- | Alias for `greaterThan`.
(>) :: forall a. (HasCompare a) => a -> a -> Boolean
(>) x y = greaterThan x y
infixl 4 >

-- | Alias for `greaterThanOrEqualTo`.
(>=) :: forall a. (HasCompare a) => a -> a -> Boolean
(>=) x y = greaterThanOrEqualTo x y
infixl 4 >=
