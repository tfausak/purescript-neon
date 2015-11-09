module Neon.Types.HasNot
  ( HasNot
  , not
  , notEqual
  , (!=)
  ) where

import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasTop (HasTop)
import Neon.Types.HasEqual (HasEqual, equal)

-- | Laws:
-- | - `not top = bottom`
-- | - `not bottom = top`
class (HasBottom a, HasTop a) <= HasNot a where
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = if x then false else true

notEqual :: forall a. (HasEqual a) => a -> a -> Boolean
notEqual x y = not (equal x y)

(!=) :: forall a. (HasEqual a) => a -> a -> Boolean
(!=) x y = notEqual x y
infix 4 !=
