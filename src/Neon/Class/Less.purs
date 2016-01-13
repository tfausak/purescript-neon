module Neon.Class.Less (Less, less) where

import Prelude as Prelude

-- | Represents types that can be compared.
-- |
-- | ``` purescript
-- | less 2 1 -- true
-- | less 1 2 -- false
-- | ```
class Less a where
  less :: a -> a -> Boolean

-- TODO: instance lessArray :: (Less a) => Less (Array a) where

instance lessBoolean :: Less Boolean where
  less y x = x Prelude.< y

instance lessChar :: Less Char where
  less y x = x Prelude.< y

instance lessInt :: Less Int where
  less y x = x Prelude.< y

-- TODO: instance lessList :: (Less a) => Less (List a) where

instance lessNumber :: Less Number where
  less y x = x Prelude.< y

instance lessString :: Less String where
  less y x = x Prelude.< y
