module Ax.Output
  ( OUTPUT()
  , print
  , warn
  ) where

import Ax.Effect (Effect())
import Ax.Unit (Unit())

foreign import data OUTPUT :: !
foreign import print :: forall e. String -> Effect (output :: OUTPUT | e) Unit
foreign import warn :: forall e. String -> Effect (output :: OUTPUT | e) Unit
