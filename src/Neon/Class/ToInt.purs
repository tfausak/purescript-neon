module Neon.Class.ToInt (ToInt, toInt) where

import Data.Enum as Enum

-- | TODO
-- |
-- | Examples:
-- | ``` purescript
-- | toInt false -- 0
-- | ```
-- |
-- | Laws:
-- | - none
class ToInt a where
  toInt :: a -> Int

instance toIntBoolean :: ToInt Boolean where
  toInt x = Enum.fromEnum x

instance toIntChar :: ToInt Char where
  toInt x = Enum.fromEnum x

instance toIntInt :: ToInt Int where
  toInt x = x
