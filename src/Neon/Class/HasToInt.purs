module Neon.Class.HasToInt where

import Data.Enum as Enum
import Neon.Data as Data

-- | Represents types that can be converted to integers. This is typically used
-- | for enumerations.
-- |
-- | ``` purescript
-- | toInt false -- 0
-- | ```
class HasToInt a where
  toInt :: a -> Int

instance booleanHasToInt :: HasToInt Boolean where
  toInt x = Enum.fromEnum x

instance charHasToInt :: HasToInt Char where
  toInt x = Enum.fromEnum x

instance intHasToInt :: HasToInt Int where
  toInt x = x

instance orderingHasToInt :: HasToInt Data.Ordering where
  toInt x = case x of
    Data.LT -> 0
    Data.EQ -> 1
    Data.GT -> 2
