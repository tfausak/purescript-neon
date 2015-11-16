module Neon.Values.List
  ( List(Cons, Nil)
  , fromList
  , toList
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasAnd ((&&))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold, foldr)
import Neon.Types.HasShow (HasShow, show)

-- | Represents a linked list of values.
data List a
  = Nil
  | Cons a (List a)

instance listHasEqual :: (HasEqual a) => HasEqual (List a) where
  equal Nil Nil = true
  equal (Cons h1 l1) (Cons h2 l2) = h1 == h2 && l1 == l2
  equal _ _ = false

instance listHasShow :: (HasShow a) => HasShow (List a) where
  show x = case x of
    Nil -> "Nil"
    Cons e l -> "Cons (" + show e + ") (" + show l + ")"

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
fromList x = case x of
  Nil -> []
  Cons e l -> [e] + fromList l
