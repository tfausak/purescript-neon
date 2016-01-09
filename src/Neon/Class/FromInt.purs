module Neon.Class.FromInt (FromInt, fromInt) where

import Data.Enum as Enum
import Data.Maybe as Maybe

class FromInt a where
  fromInt :: Int -> Maybe.Maybe a

instance fromIntBoolean :: FromInt Boolean where
  fromInt x = Enum.toEnum x

instance fromIntChar :: FromInt Char where
  fromInt x = Enum.toEnum x

instance fromIntInt :: FromInt Int where
  fromInt x = Maybe.Just x
