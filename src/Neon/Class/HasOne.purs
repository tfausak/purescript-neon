module Neon.Class.HasOne where

import Prelude as Prelude

-- | Represents types that have an multiplicative identity. This is also known
-- | as a [semiring](https://en.wikipedia.org/wiki/Semiring).
-- |
-- | ``` purescript
-- | one :: Int -- 1
-- | one :: Number -- 1.0
-- | ```
class HasOne a where
  one :: a

instance intHasOne :: HasOne Int where
  one = Prelude.one

instance numberHasOne :: HasOne Number where
  one = Prelude.one
