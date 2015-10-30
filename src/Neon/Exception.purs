module Neon.Exception
  ( EXCEPTION()
  , Exception()
  , catch
  , exception
  , throw
  ) where

import Neon.Effect (Effect())
import Neon.Show (Show)

foreign import data EXCEPTION :: !
foreign import data Exception :: *
foreign import catch :: forall e a. Effect (exception :: EXCEPTION | e) a -> (Exception -> Effect e a) -> Effect e a
foreign import exception :: String -> Exception
foreign import jsShowException :: Exception -> String
foreign import throw :: forall e a. Exception -> Effect (exception :: EXCEPTION | e) a

instance showException :: Show Exception where
  show x = jsShowException x
