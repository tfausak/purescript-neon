module Neon.Class.Multiply where

import Prelude as Prelude

-- | Represents values that can be multiplied together. This is also known as
-- | a [near-ring](https://en.wikipedia.org/wiki/Near-ring).
-- |
-- | ``` purescript
-- | multiply 3 2 -- 6
-- | ```
-- |
-- | Laws:
-- | - `x * (y * z) = (x * y) * z`
-- | - `x * (y + z) = (x * y) + (x * z)`
-- | - `x * zero = zero * x = zero`
class Multiply a where
  multiply :: a -> a -> a

instance multiplyInt :: Multiply Int where
  multiply y x = Prelude.mul x y

instance multiplyNumber :: Multiply Number where
  multiply y x = Prelude.mul x y
