module Neon.Class.Divide (Divide, divide) where

import Prelude as Prelude

-- | Represents types that are divisible.
-- |
-- | Examples:
-- | ``` purescript
-- | divide 2 7 -- 3
-- | divide 2.0 7.0 -- 3.5
-- | ```
-- |
-- | Laws:
-- | - `x / one = x`
class Divide a where
  divide :: a -> a -> a

instance divideInt :: Divide Int where
  divide y x = Prelude.div x y

instance divideNumber :: Divide Number where
  divide y x = Prelude.div x y
