module Neon.Types.IsBounded
  ( module Neon.Types.IsBounded
  , module Neon.Types.HasBottom
  , module Neon.Types.HasTop
  ) where

import Neon.Types.HasBottom
import Neon.Types.HasTop
import Neon.Values.Ordering (Ordering())

class (HasBottom a, HasTop a) <= IsBounded a

instance booleanIsBounded :: IsBounded Boolean

instance charIsBounded :: IsBounded Char

instance intIsBounded :: IsBounded Int

instance orderingIsBounded :: IsBounded Ordering
