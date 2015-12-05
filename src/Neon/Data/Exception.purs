module Neon.Data.Exception (Exception(), exception) where

foreign import nativeException :: String -> Exception

foreign import data Exception :: *

exception :: String -> Exception
exception = nativeException
