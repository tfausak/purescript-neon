module Neon.Class.HasAdd where

import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be added together. This is also known as a
-- | [semigroup](https://en.wikipedia.org/wiki/Semigroup).
-- |
-- | ``` purescript
-- | 2 :add 1 -- 3
-- | "a" :add "b" -- "ab"
-- | ```
class HasAdd a where
  add :: a -> a -> a

instance arrayHasAdd :: HasAdd (Array a) where
  add y x = Prelude.append x y

instance booleanHasAdd :: HasAdd Int where
  add y x = Prelude.add x y

instance listHasAdd :: HasAdd (Data.List a) where
  add y x = Prelude.append x y

instance numberHasAdd :: HasAdd Number where
  add y x = Prelude.add x y

instance orderingHasAdd :: HasAdd Data.Ordering where
  add y x = Prelude.append x y

instance stringHasAdd :: HasAdd String where
  add y x = Prelude.append x y
