module Neon.Effect.Console (CONSOLE(), info, log, warn, error) where

import Neon.Effect.Effect (Effect())
import Neon.Data.Unit (Unit())

foreign import nativeInfo :: forall a. String -> Effect (console :: CONSOLE | a) Unit
foreign import nativeLog :: forall a. String -> Effect (console :: CONSOLE | a) Unit
foreign import nativeWarn :: forall a. String -> Effect (console :: CONSOLE | a) Unit
foreign import nativeError :: forall a. String -> Effect (console :: CONSOLE | a) Unit

foreign import data CONSOLE :: !

info :: forall a. String -> Effect (console :: CONSOLE | a) Unit
info = nativeInfo

log :: forall a. String -> Effect (console :: CONSOLE | a) Unit
log = nativeLog

warn :: forall a. String -> Effect (console :: CONSOLE | a) Unit
warn = nativeWarn

error :: forall a. String -> Effect (console :: CONSOLE | a) Unit
error = nativeError
