module Neon.Class.Subtract (Subtract, subtract) where

import Prelude as Prelude

-- | Represents types that can be subtracted from each other.
-- |
-- | Examples:
-- | ``` purescript
-- | subtract 2 3 -- 1
-- | ```
-- |
-- | Laws:
-- | - `a - a = a + (zero - a) = zero`
class Subtract a where
  subtract :: a -> a -> a

-- TODO: instance subtractArray :: (Equal a) => Subtract (Array a) where

instance subtractInt :: Subtract Int where
  subtract y x = Prelude.sub x y

-- TODO: instance subtractList :: (Equal a) => Subtract (List a) where

instance subtractNumber :: Subtract Number where
  subtract y x = Prelude.sub x y
