module Neon.Class.HasDivide where

import Prelude as Prelude

-- | Represents types that are divisible.
-- |
-- | ``` purescript
-- | 7 :divide 2 -- 3
-- | 7.0 :divide 2.0 -- 3.5
-- | ```
class HasDivide a where
  divide :: a -> a -> a

instance intHasDivide :: HasDivide Int where
  divide y x = Prelude.div x y

instance numberHasDivide :: HasDivide Number where
  divide y x = Prelude.div x y
