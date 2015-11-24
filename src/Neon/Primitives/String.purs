module Neon.Primitives.String
  ( toCharArray
  ) where

-- | Converts a string into an array of characters.
-- |
-- | ``` purescript
-- | toCharArray "ab"
-- | -- ['a', 'b']
-- | ```
foreign import toCharArray :: String -> Array Char
