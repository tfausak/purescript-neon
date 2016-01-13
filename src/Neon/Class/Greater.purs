module Neon.Class.Greater (class Greater, greater) where

import Prelude (..) as Prelude

-- | Represents types that can be compared.
-- |
-- | ``` purescript
-- | greater 1 2 -- true
-- | greater 2 1 -- false
-- | ```
class Greater a where
  greater :: a -> a -> Boolean

-- TODO: instance greaterArray :: (Greater a) => Greater (Array a) where

instance greaterBoolean :: Greater Boolean where
  greater y x = x Prelude.> y

instance greaterChar :: Greater Char where
  greater y x = x Prelude.> y

instance greaterInt :: Greater Int where
  greater y x = x Prelude.> y

-- TODO: instance greaterList :: (Greater a) => Greater (List a) where

instance greaterNumber :: Greater Number where
  greater y x = x Prelude.> y

instance greaterString :: Greater String where
  greater y x = x Prelude.> y
