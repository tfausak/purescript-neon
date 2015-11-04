module Neon.Values.Ordering
  ( Ordering(LessThan, EqualTo, GreaterThan)
  ) where

import Neon.Types.HasEqual (HasEqual, equal)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.IsBounded (IsBounded, bottom, top)

data Ordering
  = LessThan
  | EqualTo
  | GreaterThan

instance orderingHasEqual :: HasEqual Ordering where
  equal x y = case x of
    LessThan -> case y of
      LessThan -> true
      _ -> false
    EqualTo -> case y of
      EqualTo -> true
      _ -> false
    GreaterThan -> case y of
      GreaterThan -> true
      _ -> false

instance orderingHasShow :: HasShow Ordering where
  show x = case x of
    LessThan -> "LessThan"
    EqualTo -> "EqualTo"
    GreaterThan -> "GreaterThan"

instance orderingIsBounded :: IsBounded Ordering where
  bottom = LessThan
  top = GreaterThan
