module Neon.Data.Exception (Exception(), exception) where

import Neon.Class.Add (add)
import Neon.Class.Equal (class Equal)
import Neon.Class.Show (class Show, show)

foreign import nativeEqual :: Exception -> Exception -> Boolean
foreign import nativeFromException :: Exception -> String
foreign import nativeToException :: String -> Exception

foreign import data Exception :: *

instance equalException :: Equal Exception where
  equal = nativeEqual

instance showException :: Show Exception where
  show x = add "exception " (show (nativeFromException x))

exception :: String -> Exception
exception = nativeToException
