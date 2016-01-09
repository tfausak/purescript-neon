module Neon.Class.Less (Less, isLess) where

import Prelude as Prelude

class Less a where
  isLess :: a -> a -> Boolean

-- TODO: instance lessArray :: (Less a) => Less (Array a) where

instance lessBoolean :: Less Boolean where
  isLess y x = x Prelude.< y

instance lessChar :: Less Char where
  isLess y x = x Prelude.< y

instance lessInt :: Less Int where
  isLess y x = x Prelude.< y

-- TODO: instance lessList :: (Less a) => Less (List a) where

instance lessNumber :: Less Number where
  isLess y x = x Prelude.< y

instance lessString :: Less String where
  isLess y x = x Prelude.< y
