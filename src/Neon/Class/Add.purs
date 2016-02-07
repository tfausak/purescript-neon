module Neon.Class.Add where

import Prelude as Prelude

-- | Represents types that can be added together. This is also known as a [semigroup](https://en.wikipedia.org/wiki/Semigroup).
-- |
-- | ``` purescript
-- | add 1 2 -- 3
-- | add "b" "a" -- "ab"
-- | ```
-- |
-- | Laws:
-- | - `x + (y + z) = (x + y) + z`
class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add y x = Prelude.append x y

instance addInt :: Add Int where
  add y x = Prelude.add x y

instance addNumber :: Add Number where
  add y x = Prelude.add x y

instance addString :: Add String where
  add y x = Prelude.append x y
