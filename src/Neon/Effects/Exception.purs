module Neon.Effects.Exception
  ( EXCEPTION()
  , Exception()
  , catch
  , exception
  , throw
  ) where

import Neon.Effects.Effect (Effect())
import Neon.Types.Show (Show)

foreign import data EXCEPTION :: !
foreign import data Exception :: *
foreign import catch :: forall e a. Effect (exception :: EXCEPTION | e) a -> (Exception -> Effect e a) -> Effect e a
foreign import exception :: String -> Exception
foreign import nativeShowException :: Exception -> String
foreign import throw :: forall e a. Exception -> Effect (exception :: EXCEPTION | e) a

instance showException :: Show Exception where
  show x = nativeShowException x
