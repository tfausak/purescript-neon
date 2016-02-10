module Neon.Class.FromInt where

import Data.Enum as Enum
import Neon.Data as Data

class FromInt a where
  fromInt :: Int -> Data.Maybe a

instance fromIntBoolean :: FromInt Boolean where
  fromInt x = Enum.toEnum x

instance fromIntChar :: FromInt Char where
  fromInt x = Enum.toEnum x
