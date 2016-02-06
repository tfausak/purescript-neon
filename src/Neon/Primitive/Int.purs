module Neon.Primitive.Int where

import Data.Int as Int

-- | Converts an integer into a number.
-- |
-- | ``` purescript
-- | toNumber 1 -- 1.0
-- | ```
toNumber :: Int -> Number
toNumber x = Int.toNumber x
