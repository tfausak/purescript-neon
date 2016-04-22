module Neon.Class.HasToInt where

import Data.Enum as Enum

class HasToInt a where
  toInt :: a -> Int

instance booleanHasToInt :: HasToInt Boolean where
  toInt x = Enum.fromEnum x

instance charHasToInt :: HasToInt Char where
  toInt x = Enum.fromEnum x

instance intHasToInt :: HasToInt Int where
  toInt x = x
