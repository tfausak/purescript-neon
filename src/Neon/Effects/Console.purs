module Neon.Effects.Console
  ( CONSOLE()
  , info
  , log
  , warn
  , error
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Values.Unit (Unit())

foreign import data CONSOLE :: !

foreign import info :: forall e. String -> Effect (console :: CONSOLE | e) Unit
foreign import log :: forall e. String -> Effect (console :: CONSOLE | e) Unit
foreign import warn :: forall e. String -> Effect (console :: CONSOLE | e) Unit
foreign import error :: forall e. String -> Effect (console :: CONSOLE | e) Unit
