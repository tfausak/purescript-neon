module Neon.Values.These
  ( These(This, That, Both)
  , these
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAnd ((&&))
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasPure (HasPure)
import Neon.Types.HasShow (HasShow, show)

-- | Represents either one value or another, or both. This is different than
-- | `Either`, which only represents one or the other. And `Pair` only
-- | represents both values.
data These a b
  = This a
  | That b
  | Both a b

instance theseHasAdd :: (HasAdd a, HasAdd b) => HasAdd (These a b) where
  add (This a) (This c) = This (a + c)
  add (This a) (That d) = Both a d
  add (This a) (Both c d) = Both (a + c) d
  add (That b) (This c) = Both c b
  add (That b) (That d) = That (b + d)
  add (That b) (Both c d) = Both c (b + d)
  add (Both a b) (This c) = Both (a + c) b
  add (Both a b) (That d) = Both a (b + d)
  add (Both a b) (Both c d) = Both (a + c) (b + d)

instance theseHasApply :: (HasAdd a) => HasApply (These a) where
  apply (This a) _ = This a
  apply (That _) (This c) = This c
  apply (That b) (That d) = That (b d)
  apply (That b) (Both c d) = Both c (b d)
  apply (Both a _) (This c) = This (a + c)
  apply (Both a b) (That d) = Both a (b d)
  apply (Both a b) (Both c d) = Both (a + c) (b d)

instance theseHasBind :: (HasAdd a) => HasBind (These a) where
  bind x f = case x of
    This a -> This a
    That b -> f b
    Both a b -> case f b of
      This c -> This (a + c)
      That d -> Both a d
      Both c d -> Both (a + c) d

instance theseHasEqual :: (HasEqual a, HasEqual b) => HasEqual (These a b) where
  equal (This a) (This c) = a == c
  equal (That b) (That d) = b == d
  equal (Both a b) (Both c d) = a == c && b == d
  equal _ _ = false

instance theseHasFold :: HasFold (These a) where
  foldl f y x = case x of
    This _ -> y
    That b -> f y b
    Both _ b -> f y b
  foldr f y x = case x of
    This _ -> y
    That b -> f b y
    Both _ b -> f b y

instance theseHasMap :: HasMap (These a) where
  map f x = case x of
    This a -> This a
    That b -> That (f b)
    Both a b -> Both a (f b)

instance theseHasPure :: (HasAdd a) => HasPure (These a) where
  pure x = That x

instance theseHasShow :: (HasShow a, HasShow b) => HasShow (These a b) where
  show x = case x of
    This a -> "This (" + show a + ")"
    That b -> "That (" + show b + ")"
    Both a b -> "Both (" + show a + ") (" + show b + ")"

-- | Applies the first function to `This` values, the second function to `That`
-- | values, and the third function to `Both` values.
-- |
-- | ``` purescript
-- | these (+ 2) (* 2) (+) (This 3)
-- | -- 5
-- | these (+ 2) (* 2) (+) (That 3)
-- | -- 6
-- | these (+ 2) (* 2) (+) (Both 3 4)
-- | -- 7
-- | ```
these :: forall a b c. (a -> c) -> (b -> c) -> (a -> b -> c) -> These a b -> c
these f g h x = case x of
  This a -> f a
  That b -> g b
  Both a b -> h a b
