module Neon.Types.IsEnumerable
  ( IsEnumerable
  , fromEnum
  , toEnum
  , succ
  , pred
  ) where

import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasTop (HasTop)
import Neon.Values.Maybe (Maybe(Nothing, Just))

-- | Laws:
-- | - `pred bottom = Nothing`
-- | - `succ top = Nothing`
-- | - `toEnum (fromEnum x) = Just x`
-- | - `compare x y = compare (fromEnum x) (fromEnum y)`
class (HasBottom a, HasTop a) <= IsEnumerable a where
  fromEnum :: a -> Int
  toEnum :: Int -> Maybe a
  succ :: a -> Maybe a
  pred :: a -> Maybe a

instance booleanIsEnumerable :: IsEnumerable Boolean where
  fromEnum x = case x of
    false -> 0
    true -> 1
  toEnum x = case x of
    0 -> Just false
    1 -> Just true
    _ -> Nothing
  succ x = case x of
    false -> Just true
    true -> Nothing
  pred x = case x of
    false -> Nothing
    true -> Just true
