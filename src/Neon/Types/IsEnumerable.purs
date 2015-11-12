module Neon.Types.IsEnumerable
  ( IsEnumerable
  , fromEnum
  , toEnum
  , succ
  , pred
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasBottom (HasBottom, bottom)
import Neon.Types.HasCompare ((<), (>))
import Neon.Types.HasEqual ((==))
import Neon.Types.HasOr ((||))
import Neon.Types.HasSubtract ((-))
import Neon.Types.HasTop (HasTop, top)
import Neon.Values.Maybe (Maybe(Nothing, Just))
import Neon.Values.Unit (Unit(), unit)

foreign import nativeFromEnumChar :: Char -> Int
foreign import nativeToEnumChar :: Int -> Char

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
    true -> Just false

instance charIsEnumerable :: IsEnumerable Char where
  fromEnum x = nativeFromEnumChar x
  toEnum x = if x < fromEnum (bottom :: Char) || x > fromEnum (top :: Char)
    then Nothing
    else Just (nativeToEnumChar x)
  succ x = toEnum (fromEnum x + 1)
  pred x = toEnum (fromEnum x - 1)

instance intIsEnumerable :: IsEnumerable Int where
  fromEnum x = x
  toEnum x = Just x
  succ x = if x == top then Nothing else Just (x + 1)
  pred x = if x == bottom then Nothing else Just (x - 1)

instance maybeIsEnumerable :: (IsEnumerable a) => IsEnumerable (Maybe a) where
  fromEnum x = case x of
    Nothing -> 0
    Just j -> 1 + fromEnum j
  toEnum x = case x of
    0 -> Just Nothing
    _ -> case toEnum (x - 1) of
      Nothing -> Nothing
      Just j -> Just (Just j)
  succ x = case x of
    Nothing -> Just bottom
    Just j -> case succ j of
      Nothing -> Nothing
      Just k -> Just (Just k)
  pred x = case x of
    Nothing -> Nothing
    Just j -> Just (pred j)

instance unitIsEnumerable :: IsEnumerable Unit where
  fromEnum _ = 0
  toEnum x = if x == 0 then Just unit else Nothing
  succ _ = Nothing
  pred _ = Nothing
