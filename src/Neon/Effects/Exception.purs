module Neon.Effects.Exception
  ( EXCEPTION()
  , Exception()
  , catch
  , exception
  , throw
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Types.HasShow (HasShow)

-- | Represents effects that can throw exceptions.
foreign import data EXCEPTION :: !
foreign import nativeShow :: Exception -> String

-- | An alias for `Error` from JavaScript.
foreign import data Exception :: *

-- | Creates an exception with the given message.
-- |
-- | ``` purescript
-- | show (exception "Boink!")
-- | -- "Error: Boink!"
-- | ```
foreign import exception :: String -> Exception

-- | Throws an exception.
-- |
-- | ``` purescript
-- | throw (exception "Boink!")
-- | ```
foreign import throw :: forall e a. Exception -> Effect (exception :: EXCEPTION | e) a

-- | Catches an exception.
-- |
-- | ``` purescript
-- | catch
-- |   (throw (exception "Boink!"))
-- |   (\ e -> error (show e))
-- | --
-- | ```
foreign import catch :: forall e a. Effect (exception :: EXCEPTION | e) a -> (Exception -> Effect e a) -> Effect e a

instance exceptionHasShow :: HasShow Exception where
  show = nativeShow
