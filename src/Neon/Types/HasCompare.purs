module Neon.Types.HasCompare
  ( HasCompare
  , clamp
  , compare
  , comparing
  , gt
  , gte
  , lt
  , lte
  , max
  , min
  , (<)
  , (<=)
  , (>)
  , (>=)
  ) where

import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

foreign import nativeCompareArray :: forall a. (HasCompare a) => Ordering -> Ordering -> Ordering -> Array a -> Array a -> Ordering
foreign import nativeCompareChar :: Ordering -> Ordering -> Ordering -> Char -> Char -> Ordering
foreign import nativeCompareFunction :: forall a b. Ordering -> Ordering -> Ordering -> (a -> b) -> (a -> b) -> Ordering
foreign import nativeCompareInt :: Ordering -> Ordering -> Ordering -> Int -> Int -> Ordering
foreign import nativeCompareNumber :: Ordering -> Ordering -> Ordering -> Number -> Number -> Ordering
foreign import nativeCompareString :: Ordering -> Ordering -> Ordering -> String -> String -> Ordering

-- | Represents types that can be compared to each other. This is also known as
-- | a [total order](https://en.wikipedia.org/wiki/Total_order).
-- |
-- | Laws:
-- | - Reflexivity: `a <= a`
-- | - Antisymmetry: if `a <= b` and `b <= a` then `a = b`
-- | - Transitivity: if `a <= b` and `b <= c` then `a <= c`
class (HasEqual a) <= HasCompare a where
  -- | Compares two values to each other. Returns `LessThan` if the first
  -- | argument is less than the second.
  -- |
  -- | ``` purescript
  -- | compare "b" "a"
  -- | -- GreaterThan
  -- | ```
  compare :: a -> a -> Ordering

instance arrayHasCompare :: (HasCompare a) => HasCompare (Array a) where
  compare x y = nativeCompareArray LessThan EqualTo GreaterThan x y

instance booleanHasCompare :: HasCompare Boolean where
  compare x y = if x == y
    then EqualTo
    else case x of
      true -> GreaterThan
      false -> LessThan

instance charHasCompare :: HasCompare Char where
  compare x y = nativeCompareChar LessThan EqualTo GreaterThan x y

instance functionHasCompare :: HasCompare (a -> b) where
  compare f g = nativeCompareFunction LessThan EqualTo GreaterThan f g

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

-- | Returns `true` if the first value is less than the second value, `false`
-- | otherwise.
-- |
-- | ``` purescript
-- | lt "a" "b"
-- | -- true
-- | ```
lt :: forall a. (HasCompare a) => a -> a -> Boolean
lt x y = case compare x y of
  LessThan -> true
  _ -> false

-- | Alias for `lt`.
-- |
-- | ``` purescript
-- | "a" < "b"
-- | -- true
-- | ```
(<) :: forall a. (HasCompare a) => a -> a -> Boolean
(<) x y = lt x y
infixl 4 <

-- | Returns `true` if the first value is less than or equal to the second
-- | value, `false` otherwise.
-- |
-- | ``` purescript
-- | lte "a" "a"
-- | -- true
-- | ```
lte :: forall a. (HasCompare a) => a -> a -> Boolean
lte x y = case compare x y of
  GreaterThan -> false
  _ -> true

-- | Alias for `lte`.
-- |
-- | ``` purescript
-- | "a" < "a"
-- | -- true
-- | ```
(<=) :: forall a. (HasCompare a) => a -> a -> Boolean
(<=) x y = lte x y
infixl 4 <=

-- | Returns `true` if the first value is greater than or equal to the second
-- | value, `false` otherwise.
-- |
-- | ``` purescript
-- | gte "a" "a"
-- | -- true
-- | ```
gte :: forall a. (HasCompare a) => a -> a -> Boolean
gte x y = case compare x y of
  LessThan -> false
  _ -> true

-- | Alias for `gte`.
-- |
-- | ``` purescript
-- |  "a" >= "a"
-- | -- true
-- | ```
(>=) :: forall a. (HasCompare a) => a -> a -> Boolean
(>=) x y = gte x y
infixl 4 >=

-- | Returns `true` if the first value is greater than the second value,
-- | `false` otherwise.
-- |
-- | ``` purescript
-- | gt "b" "a"
-- | -- true
-- | ```
gt :: forall a. (HasCompare a) => a -> a -> Boolean
gt x y = case compare x y of
  GreaterThan -> true
  _ -> false

-- | Alias for `gt`.
-- |
-- | ``` purescript
-- | "b" > "a"
-- | -- true
-- | ```
(>) :: forall a. (HasCompare a) => a -> a -> Boolean
(>) x y = gt x y
infixl 4 >

-- | Returns the lesser of two values.
-- |
-- | ``` purescript
-- | min "a" "b"
-- | -- "a"
-- | ```
min :: forall a. (HasCompare a) => a -> a -> a
min x y = if x < y then x else y

-- | Returns the greater of two values.
-- |
-- | ``` purescript
-- | max "a" "b"
-- | -- "b"
-- | ```
max :: forall a. (HasCompare a) => a -> a -> a
max x y = if x > y then x else y

-- | Clamps the value to the given range.
-- |
-- | ``` purescript
-- | clamp 2 4 1
-- | -- 2
-- | clamp 2 4 3
-- | -- 3
-- | clamp 2 4 5
-- | -- 4
-- | ```
clamp :: forall a. (HasCompare a) => a -> a -> a -> a
clamp l h x = if l > h then clamp h l x
  else if x < l then l
  else if x > h then h
  else x

-- | Applies a function to both values and compares the results.
-- |
-- | ``` purescript
-- | comparing (/ 2) 4 5
-- | -- EqualTo
-- | ```
comparing :: forall a b. (HasCompare a) => (b -> a) -> b -> b -> Ordering
comparing f x y = compare (f x) (f y)
