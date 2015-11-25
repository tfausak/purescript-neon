module Neon.Values.Regex
  ( Regex()
  , RegexFlags()
  , regex
  , regexFlags
  , test
  ) where

import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasShow (HasShow)

foreign import nativeEqual :: Regex -> Regex -> Boolean
foreign import nativeRegex :: String -> RegexFlags -> Regex
foreign import nativeShow :: Regex -> String
foreign import nativeTest :: String -> Regex -> Boolean

-- | Represents regular expressions. A wrapper around `RegExp` from JavaScript.
foreign import data Regex :: *

instance regexHasEqual :: HasEqual Regex where
  equal x y = nativeEqual x y

instance regexHasShow :: HasShow Regex where
  show x = nativeShow x

-- | Represents the flags that a regex can have.
type RegexFlags =
  { ignoreCase :: Boolean
  , global :: Boolean
  , multiline :: Boolean
  }

-- | Creates a regular expression.
-- |
-- | ``` purescript
-- | show (regex "a" { ignoreCase: true, global: false, multiline: false })
-- | -- "regex \"a\" { ignoreCase: true, global: false, multiline: false }"
-- | ```
regex :: String -> RegexFlags -> Regex
regex = nativeRegex

-- | Returns the default regular expression flags.
-- |
-- | ``` purescript
-- | show regexFlags
-- | -- "{ ignoreCase: false, global: false, multiline: false }"
-- | ```
regexFlags :: RegexFlags
regexFlags =
  { ignoreCase: false
  , global: false
  , multiline: false
  }

-- | Tests if a regular expression matches a string.
-- |
-- | ``` purescript
-- | test "a" (regex "a" regexFlags)
-- | -- true
-- | ```
test :: String -> Regex -> Boolean
test = nativeTest
