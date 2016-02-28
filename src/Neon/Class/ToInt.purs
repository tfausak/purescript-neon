module Neon.Class.ToInt where

import Data.Enum as Enum

class ToInt a where
  toInt :: a -> Int

instance toIntBoolean :: ToInt Boolean where
  toInt x = Enum.fromEnum x

instance toIntChar :: ToInt Char where
  toInt x = Enum.fromEnum x

instance toIntInt :: ToInt Int where
  toInt x = x
