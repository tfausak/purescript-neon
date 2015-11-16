module Neon.Primitives.Char
  ( toLower
  , toUpper
  ) where

-- | Convert a character to lower case.
-- |
-- | ``` purescript
-- | toLower 'A'
-- | -- 'a'
-- | ```
foreign import toLower :: Char -> Char

-- | Convert a character to upper case.
-- |
-- | ``` purescript
-- | toUpper 'a'
-- | -- 'A'
-- | ```
foreign import toUpper :: Char -> Char
