module Neon.Class.HasFromInt where

import Data.Enum as Enum
import Neon.Data as Data

class HasFromInt a where
  fromInt :: Int -> Data.Maybe a

instance booleanHasFromInt :: HasFromInt Boolean where
  fromInt x = Enum.toEnum x

instance charHasFromInt :: HasFromInt Char where
  fromInt x = Enum.toEnum x

instance intHasFromInt :: HasFromInt Int where
  fromInt x = Data.Just x
