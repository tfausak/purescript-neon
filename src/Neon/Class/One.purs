module Neon.Class.One (One, one) where

import Prelude as Prelude

-- | Represents types that have an multiplicative identity. This is also known
-- | as a [semiring](https://en.wikipedia.org/wiki/Semiring).
-- |
-- | ``` purescript
-- | one :: Int -- 1
-- | one :: Number -- 1.0
-- | ```
-- |
-- | Laws:
-- | - Identity: `one * x = x * one = x`
class One a where
  one :: a

instance oneInt :: One Int where
  one = Prelude.one

instance oneNumber :: One Number where
  one = Prelude.one
