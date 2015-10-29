module Ax.Compare
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

import Ax.Equal (Equal, (==))
import Ax.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

foreign import jsCompareArray :: forall a. (Compare a) => Ordering -> Ordering -> Ordering -> (a -> a -> Ordering) -> Array a -> Array a -> Ordering
foreign import jsCompareChar :: Ordering -> Ordering -> Ordering -> Char -> Char -> Ordering
foreign import jsCompareInt :: Ordering -> Ordering -> Ordering -> Int -> Int -> Ordering
foreign import jsCompareNumber :: Ordering -> Ordering -> Ordering -> Number -> Number -> Ordering
foreign import jsCompareString :: Ordering -> Ordering -> Ordering -> String -> String -> Ordering

class (Equal a) <= Compare a where
  compare :: a -> a -> Ordering

instance compareArray :: (Compare a) => Compare (Array a) where
  compare x y = jsCompareArray LessThan EqualTo GreaterThan compare x y

instance compareBoolean :: Compare Boolean where
  compare x y = if x == y
    then EqualTo
    else case x of
      true -> GreaterThan
      false -> LessThan

instance compareChar :: Compare Char where
  compare x y = jsCompareChar LessThan EqualTo GreaterThan x y

instance compareInt :: Compare Int where
  compare x y = jsCompareInt LessThan EqualTo GreaterThan x y

instance compareNumber :: Compare Number where
  compare x y = jsCompareNumber LessThan EqualTo GreaterThan x y

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
  compare x y = jsCompareString LessThan EqualTo GreaterThan x y

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

(<) :: forall a. (Compare a) => a -> a -> Boolean
(<) x y = lessThan x y
infixl 4 <

(<=) :: forall a. (Compare a) => a -> a -> Boolean
(<=) x y = lessThanOrEqualTo x y
infixl 4 <=

(>) :: forall a. (Compare a) => a -> a -> Boolean
(>) x y = greaterThan x y
infixl 4 >

(>=) :: forall a. (Compare a) => a -> a -> Boolean
(>=) x y = greaterThanOrEqualTo x y
infixl 4 >=
