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

-- | TODO
foreign import data Regex :: *

instance regexHasEqual :: HasEqual Regex where
  equal x y = nativeEqual x y

instance regexHasShow :: HasShow Regex where
  show x = nativeShow x

-- | TODO
type RegexFlags =
  { ignoreCase :: Boolean
  , global :: Boolean
  , multiline :: Boolean
  }

-- | TODO
regex :: String -> RegexFlags -> Regex
regex s f = nativeRegex s f

-- | TODO
regexFlags :: RegexFlags
regexFlags =
  { ignoreCase: false
  , global: false
  , multiline: false
  }

-- | TODO
test :: String -> Regex -> Boolean
test s r = nativeTest s r
