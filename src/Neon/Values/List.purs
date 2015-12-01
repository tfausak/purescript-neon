module Neon.Values.List
  ( List(Cons, Nil)
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasAnd ((&&))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold, foldl, foldr, foldMap)
import Neon.Types.HasFromArray (HasFromArray)
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasToArray (HasToArray)

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

instance listHasFromArray :: HasFromArray a (List a) where
  fromArray xs = foldr Cons Nil xs

instance listHasMap :: HasMap List where
  map f xs = case xs of
    Nil -> Nil
    Cons x l -> Cons (f x) (map f l)

instance listHasShow :: (HasShow a) => HasShow (List a) where
  show xs = case xs of
    Nil -> "Nil"
    Cons x l -> "Cons (" + show x + ") (" + show l + ")"

instance listHasToArray :: HasToArray (List a) a where
  toArray xs = foldMap (\ x -> [x]) xs
