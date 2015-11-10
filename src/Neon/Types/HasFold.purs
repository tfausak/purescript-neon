module Neon.Types.HasFold
  ( HasFold
  , foldl
  , foldr
  , foldMap
  , length
  , isPresent
  , isBlank
  , contains
  , sum
  , product
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasAdd ((+))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasMultiply ((*))
import Neon.Types.HasNot (not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasZero (HasZero, zero)

foreign import nativeFoldlArray :: forall a b. (b -> a -> b) -> b -> Array a -> b
foreign import nativeFoldrArray :: forall a b. (a -> b -> b) -> b -> Array a -> b

class HasFold f where
  foldl :: forall a b. (b -> a -> b) -> b -> f a -> b
  foldr :: forall a b. (a -> b -> b) -> b -> f a -> b

instance arrayHasFold :: HasFold Array where
  foldl f y xs = nativeFoldlArray f y xs
  foldr f y xs = nativeFoldrArray f y xs

foldMap :: forall f a m. (HasFold f, HasZero m) => (a -> m) -> f a -> m
foldMap f xs = foldl (\ a e -> a + f e) zero xs

length :: forall f a. (HasFold f) => f a -> Int
length xs = foldMap (constant 1) xs

isPresent :: forall f a. (HasFold f) => f a -> Boolean
isPresent xs = foldMap (constant true) xs

isBlank :: forall f a. (HasFold f) => f a -> Boolean
isBlank xs = not (isPresent xs)

contains :: forall f a. (HasFold f, HasEqual a) => a -> f a -> Boolean
contains x xs = foldMap (== x) xs

sum :: forall f a. (HasFold f, HasZero a) => f a -> a
sum xs = foldl (+) zero xs

product :: forall f a. (HasFold f, HasOne a) => f a -> a
product xs = foldl (*) one xs
