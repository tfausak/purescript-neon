module Neon.Class.FromInt (class FromInt, fromInt) where

import Neon.Class.Bottom (bottom)
import Neon.Class.Greater (greater)
import Neon.Class.Less (less)
import Neon.Class.Or (or)
import Neon.Class.Top (top)
import Neon.Data.Maybe (Maybe(Nothing, Just))

foreign import nativeFromIntChar :: Int -> Char

class FromInt a where
  fromInt :: Int -> Maybe a

instance fromIntBoolean :: FromInt Boolean where
  fromInt x = case x of
    0 -> Just false
    1 -> Just true
    _ -> Nothing

instance fromIntChar :: FromInt Char where
  fromInt x =
    if or (less x bottom) (greater x top)
    then Nothing
    else Just (nativeFromIntChar x)

instance fromIntInt :: FromInt Int where
  fromInt = Just
