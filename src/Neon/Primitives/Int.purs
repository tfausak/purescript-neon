module Neon.Primitives.Int
  ( toNumber
  ) where

-- | Converts an integer into a number.
-- |
-- | ``` purescript
-- | toNumber 1
-- | -- 1.0
-- | ```
foreign import toNumber :: Int -> Number
