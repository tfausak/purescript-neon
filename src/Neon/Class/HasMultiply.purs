module Neon.Class.HasMultiply where

import Prelude as Prelude

-- | Represents values that can be multiplied together. This is also known as
-- | a [near-ring](https://en.wikipedia.org/wiki/Near-ring).
-- |
-- | ``` purescript
-- | 2 :multiply 3 -- 6
-- | ```
class HasMultiply a where
  multiply :: a -> a -> a

instance intHasMultiply :: HasMultiply Int where
  multiply y x = Prelude.mul x y

instance numberHasMultiply :: HasMultiply Number where
  multiply y x = Prelude.mul x y
