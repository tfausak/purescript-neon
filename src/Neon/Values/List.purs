module Neon.Values.List
  ( List(Cons, Nil)
  , fromList
  , toList
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasAnd ((&&))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold, foldl, foldr, foldMap)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasPure (pure)
import Neon.Types.HasShow (HasShow, show)

-- | Represents a linked list of values.
data List a
  = Nil
  | Cons a (List a)

instance listHasEqual :: (HasEqual a) => HasEqual (List a) where
  equal Nil Nil = true
  equal (Cons x1 l1) (Cons x2 l2) = x1 == x2 && l1 == l2
  equal _ _ = false

instance listHasFold :: HasFold List where
  foldl f y xs = case xs of
    Nil -> y
    Cons x l -> foldl f (f y x) l
  foldr f y xs = case xs of
    Nil -> y
    Cons x l -> f x (foldr f y l)

instance listHasMap :: HasMap List where
  map f xs = case xs of
    Nil -> Nil
    Cons x l -> Cons (f x) (f <$> l)

instance listHasShow :: (HasShow a) => HasShow (List a) where
  show xs = case xs of
    Nil -> "Nil"
    Cons x l -> "Cons (" + show x + ") (" + show l + ")"

-- | Converts a foldable container into a list.
-- |
-- | ``` purescript
-- | toList [1, 2]
-- | -- Cons 1 (Cons 2 Nil)
-- | ```
toList :: forall f a. (HasFold f) => f a -> List a
toList xs = foldr Cons Nil xs

-- | Converts a list into an array.
-- |
-- | ``` purescript
-- | fromList (Cons 1 (Cons 2 Nil))
-- | -- [1, 2]
-- | ```
fromList :: forall a. List a -> Array a
fromList xs = foldMap (\ x -> [x]) xs
