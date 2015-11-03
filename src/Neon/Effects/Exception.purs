module Neon.Effects.Exception
  ( EXCEPTION()
  , Exception()
  , catch
  , exception
  , throw
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Types.HasShow (HasShow)

foreign import data EXCEPTION :: !
foreign import data Exception :: *
foreign import catch :: forall e a. Effect (exception :: EXCEPTION | e) a -> (Exception -> Effect e a) -> Effect e a
foreign import exception :: String -> Exception
foreign import nativeShow :: Exception -> String
foreign import throw :: forall e a. Exception -> Effect (exception :: EXCEPTION | e) a

instance exceptionHasShow :: HasShow Exception where
  show x = nativeShow x
