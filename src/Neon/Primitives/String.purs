module Neon.Primitives.String
  ( fromCharArray
  , toCharArray
  ) where

-- | Converts a string into an array of characters.
-- |
-- | ``` purescript
-- | toCharArray "ab"
-- | -- ['a', 'b']
-- | ```
foreign import toCharArray :: String -> Array Char

-- | Converts an array of characters into a string.
-- |
-- | ``` purescript
-- | fromCharArray ['a', 'b']
-- | -- "ab"
-- | ```
foreign import fromCharArray :: Array Char -> String
