module Ax.Ordering
  ( Ordering(LessThan, EqualTo, GreaterThan)
  ) where

import Ax.Bounded (Bounded, bottom, top)
import Ax.Equal (Equal, equal)
import Ax.Show (Show, show)

data Ordering
  = LessThan
  | EqualTo
  | GreaterThan

instance boundedOrdering :: Bounded Ordering where
  bottom = LessThan
  top = GreaterThan

instance equalOrdering :: Equal Ordering where
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

instance showOrdering :: Show Ordering where
  show x = case x of
    LessThan -> "LessThan"
    EqualTo -> "EqualTo"
    GreaterThan -> "GreaterThan"
