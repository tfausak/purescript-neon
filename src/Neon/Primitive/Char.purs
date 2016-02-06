module Neon.Primitive.Char where

import Data.Char as Char

-- | Converts a character to lower case.
-- |
-- | ``` purescript
-- | toLower 'A' -- 'a'
-- | toLower 'a' -- 'a'
-- | ```
toLower :: Char -> Char
toLower x = Char.toLower x

-- | Converts a character into a string.
-- |
-- | ``` purescript
-- | toString 'a' -- "a"
-- | ```
toString :: Char -> String
toString x = Char.toString x


-- | Converts a character to upper case.
-- |
-- | ``` purescript
-- | toUpper 'a' -- 'A'
-- | toUpper 'A' -- 'A'
-- | ```
toUpper :: Char -> Char
toUpper x = Char.toUpper x
