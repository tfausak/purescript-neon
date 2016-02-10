module Neon.Class.Less where

import Prelude as Prelude

class Less a where
  less :: a -> a -> Boolean

-- instance lessArray :: (Equal.Equal a, Less a) => Less (Array a) where
--   less ys xs = false -- TODO

instance lessBoolean :: Less Boolean where
  less y x = x Prelude.< y

instance lessChar :: Less Char where
  less y x = x Prelude.< y

instance lessInt :: Less Int where
  less y x = x Prelude.< y

-- instance lessList :: (Equal.Equal a, Less a) => Less (Data.List a) where
--   less ys xs = false -- TODO

instance lessNumber :: Less Number where
  less y x = x Prelude.< y

instance lessString :: Less String where
  less y x = x Prelude.< y
