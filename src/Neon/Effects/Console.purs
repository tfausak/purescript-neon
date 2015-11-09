module Neon.Effects.Console
  ( CONSOLE()
  , print
  , warn
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Values.Unit (Unit())

foreign import data CONSOLE :: !
foreign import print :: forall e. String -> Effect (output :: CONSOLE | e) Unit
foreign import warn :: forall e. String -> Effect (output :: CONSOLE | e) Unit
