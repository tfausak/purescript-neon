module Neon.Output
  ( OUTPUT()
  , print
  , warn
  ) where

import Neon.Effect (Effect())
import Neon.Unit (Unit())

foreign import data OUTPUT :: !
foreign import print :: forall e. String -> Effect (output :: OUTPUT | e) Unit
foreign import warn :: forall e. String -> Effect (output :: OUTPUT | e) Unit
