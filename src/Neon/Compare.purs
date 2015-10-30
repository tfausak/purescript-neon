module Neon.Compare
  ( Compare
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

import Neon.Equal (Equal, (==))
import Neon.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

foreign import nativeCompareArray :: forall a. (Compare a) => Ordering -> Ordering -> Ordering -> (a -> a -> Ordering) -> Array a -> Array a -> Ordering
foreign import nativeCompareChar :: Ordering -> Ordering -> Ordering -> Char -> Char -> Ordering
foreign import nativeCompareInt :: Ordering -> Ordering -> Ordering -> Int -> Int -> Ordering
foreign import nativeCompareNumber :: Ordering -> Ordering -> Ordering -> Number -> Number -> Ordering
foreign import nativeCompareString :: Ordering -> Ordering -> Ordering -> String -> String -> Ordering

-- | Laws:
-- | - Reflexivity: `a <= a`
-- | - Antisymmetry: if `a <= b` and `b <= a` then `a = b`
-- | - Transitivity: if `a <= b` and `b <= c` then `a <= c`
class (Equal a) <= Compare a where
  compare :: a -> a -> Ordering

instance compareArray :: (Compare a) => Compare (Array a) where
  compare x y = nativeCompareArray LessThan EqualTo GreaterThan compare x y

instance compareBoolean :: Compare Boolean where
  compare x y = if x == y
    then EqualTo
    else case x of
      true -> GreaterThan
      false -> LessThan

instance compareChar :: Compare Char where
  compare x y = nativeCompareChar LessThan EqualTo GreaterThan x y

instance compareInt :: Compare Int where
  compare x y = nativeCompareInt LessThan EqualTo GreaterThan x y

instance compareNumber :: Compare Number where
  compare x y = nativeCompareNumber LessThan EqualTo GreaterThan x y

instance compareOrdering :: Compare Ordering where
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

instance compareString :: Compare String where
  compare x y = nativeCompareString LessThan EqualTo GreaterThan x y

greaterThan :: forall a. (Compare a) => a -> a -> Boolean
greaterThan x y = case compare x y of
  GreaterThan -> true
  _ -> false

greaterThanOrEqualTo :: forall a. (Compare a) => a -> a -> Boolean
greaterThanOrEqualTo x y = case compare x y of
  LessThan -> false
  _ -> true

lessThan :: forall a. (Compare a) => a -> a -> Boolean
lessThan x y = case compare x y of
  LessThan -> true
  _ -> false

lessThanOrEqualTo :: forall a. (Compare a) => a -> a -> Boolean
lessThanOrEqualTo x y = case compare x y of
  GreaterThan -> false
  _ -> true

-- | Alias for `lessThan`.
(<) :: forall a. (Compare a) => a -> a -> Boolean
(<) x y = lessThan x y
infixl 4 <

-- | Alias for `lessThanOrEqualTo`.
(<=) :: forall a. (Compare a) => a -> a -> Boolean
(<=) x y = lessThanOrEqualTo x y
infixl 4 <=

-- | Alias for `greaterThan`.
(>) :: forall a. (Compare a) => a -> a -> Boolean
(>) x y = greaterThan x y
infixl 4 >

-- | Alias for `greaterThanOrEqualTo`.
(>=) :: forall a. (Compare a) => a -> a -> Boolean
(>=) x y = greaterThanOrEqualTo x y
infixl 4 >=
