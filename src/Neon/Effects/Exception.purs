module Neon.Effects.Exception
  ( EXCEPTION()
  , Exception()
  , exception
  , throw
  , catch
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Types.HasShow (HasShow)

foreign import data EXCEPTION :: !
foreign import data Exception :: *

foreign import exception :: String -> Exception
foreign import throw :: forall e a. Exception -> Effect (exception :: EXCEPTION | e) a
foreign import catch :: forall e a. Effect (exception :: EXCEPTION | e) a -> (Exception -> Effect e a) -> Effect e a
foreign import nativeShow :: Exception -> String

instance exceptionHasShow :: HasShow Exception where
  show x = nativeShow x
