module Neon.Types.HasFold
  ( HasFold
  , contains
  , foldl
  , foldMap
  , foldr
  , isBlank
  , isPresent
  , length
  , product
  , sum
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasAdd ((+))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasMultiply ((*))
import Neon.Types.HasNot (not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasZero (HasZero, zero)

foreign import nativeFoldlArray :: forall a b. (b -> a -> b) -> b -> Array a -> b
foreign import nativeFoldrArray :: forall a b. (a -> b -> b) -> b -> Array a -> b

-- | Represents types that can be reduced to a single value. This is also known
-- | as a [fold](https://en.wikipedia.org/wiki/Fold_(higher-order_function)).
class HasFold f where
  -- | Reduces the container into a single value from left to right.
  -- |
  -- | ``` purescript
  -- | foldl (+) "hello" ["wo", "rl", "d!"]
  -- | -- "helloworld!"
  -- | ```
  foldl :: forall a b. (b -> a -> b) -> b -> f a -> b

  -- | Reduces the container into a single value from right to left.
  -- |
  -- | ``` purescript
  -- | foldr (+) "hello" ["wo", "rl", "d!"]
  -- | -- "world!hello"
  -- | ```
  foldr :: forall a b. (a -> b -> b) -> b -> f a -> b

instance arrayHasFold :: HasFold Array where
  foldl f y xs = nativeFoldlArray f y xs
  foldr f y xs = nativeFoldrArray f y xs

-- | Reduces the container into a value that supports addition and has an
-- | additive identity (that is, a monoid).
-- |
-- | ``` purescript
-- | foldMap (+ "!") ["ne", "on"]
-- | -- "ne!on!"
-- | ```
foldMap :: forall f a m. (HasFold f, HasZero m) => (a -> m) -> f a -> m
foldMap f xs = foldl (\ a e -> a + f e) zero xs

-- | Returns the length of the container.
-- |
-- | ``` purescript
-- | length [1, 2, 3]
-- | -- 3
-- | ```
length :: forall f a. (HasFold f) => f a -> Int
length xs = foldMap (always 1) xs

-- | Returns `true` if the length of the container is greater than 0,
-- | `false` otherwise.
-- |
-- | ``` purescript
-- | isPresent []
-- | -- false
-- | isPresent [1, 2, 3]
-- | -- true
-- | ```
isPresent :: forall f a. (HasFold f) => f a -> Boolean
isPresent xs = foldMap (always true) xs

-- | Returns `true` if the length of the container is 0, `false` otherwise.
-- |
-- | ``` purescript
-- | isBlank []
-- | -- true
-- | isBlank [1, 2, 3]
-- | -- false
-- | ```
isBlank :: forall f a. (HasFold f) => f a -> Boolean
isBlank xs = not (isPresent xs)

-- | Returns `true` if the container contains the given value, `false`
-- | otherwise.
-- |
-- | ``` purescript
-- | contains 1 [0, 1]
-- | -- true
-- | contains 2 [0, 1]
-- | -- false
-- | ```
contains :: forall f a. (HasFold f, HasEqual a) => a -> f a -> Boolean
contains x xs = foldMap (== x) xs

-- | Returns the sum of all the values in the container.
-- |
-- | ``` purescript
-- | sum [3, 4, 5]
-- | -- 12
-- | ```
sum :: forall f a. (HasFold f, HasZero a) => f a -> a
sum xs = foldl (+) zero xs

-- | Returns the product of all the values in the container.
-- |
-- | ``` purescript
-- | product [3, 4, 5]
-- | -- 60
-- | ```
product :: forall f a. (HasFold f, HasOne a) => f a -> a
product xs = foldl (*) one xs
