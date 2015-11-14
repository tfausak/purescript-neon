module Neon.Effects.Console
  ( CONSOLE()
  , error
  , info
  , log
  , warn
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Values.Unit (Unit())

-- | Represents effects that can write to the console.
foreign import data CONSOLE :: !

-- | Writes an info-level message to the console.
-- |
-- | ``` purescript
-- | info "Starting..."
-- | -- prints "Starting..." to STDOUT
-- | ```
foreign import info :: forall e. String -> Effect (console :: CONSOLE | e) Unit

-- | Writes a log-level message to the console.
-- |
-- | ``` purescript
-- | log "Listening.."
-- | -- prints "Listening..." to STDOUT
-- | ```
foreign import log :: forall e. String -> Effect (console :: CONSOLE | e) Unit

-- | Writes a warn-level message to the console.
-- |
-- | ``` purescript
-- | warn "Stopping..."
-- | -- prints "Stopping..." to STDERR
-- | ```
foreign import warn :: forall e. String -> Effect (console :: CONSOLE | e) Unit

-- | Writes an error-level message to the console.
-- |
-- | ``` purescript
-- | error "Exploded!"
-- | -- prints "Exploded!" to STDERR
-- | ```
foreign import error :: forall e. String -> Effect (console :: CONSOLE | e) Unit
