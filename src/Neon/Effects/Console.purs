module Neon.Effects.Console
  ( CONSOLE()
  , error
  , info
  , log
  , print
  , warn
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Types.HasShow (HasShow, show)
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

-- | Converts a value to a string and writes a log-level message to the
-- | console.
-- |
-- | ``` purescript
-- | print 1
-- | -- print "1" to STDOUT
-- | ```
print :: forall a e. (HasShow a) => a -> Effect (console :: CONSOLE | e) Unit
print x = log (show x)
