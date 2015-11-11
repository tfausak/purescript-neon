module Neon.Values.These
  ( These(This, That, Both)
  , these
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAnd ((&&))
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasShow (HasShow, show)

data These a b
  = This a
  | That b
  | Both a b

-- TODO: More instances.

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

instance theseHasEqual :: (HasEqual a, HasEqual b) => HasEqual (These a b) where
  equal (This a) (This c) = a == c
  equal (That b) (That d) = b == d
  equal (Both a b) (Both c d) = a == c && b == d
  equal _ _ = false

instance theseHasShow :: (HasShow a, HasShow b) => HasShow (These a b) where
  show x = case x of
    This a -> "This (" + show a + ")"
    That b -> "That (" + show b + ")"
    Both a b -> "Both (" + show a + ") (" + show b + ")"

these :: forall a b c. (a -> c) -> (b -> c) -> (a -> b -> c) -> These a b -> c
these f g h x = case x of
  This a -> f a
  That b -> g b
  Both a b -> h a b
