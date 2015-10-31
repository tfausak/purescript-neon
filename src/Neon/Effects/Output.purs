module Neon.Effects.Output
  ( OUTPUT()
  , print
  , warn
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Values.Unit (Unit())

foreign import data OUTPUT :: !
foreign import print :: forall e. String -> Effect (output :: OUTPUT | e) Unit
foreign import warn :: forall e. String -> Effect (output :: OUTPUT | e) Unit
