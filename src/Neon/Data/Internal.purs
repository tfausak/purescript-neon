module Neon.Data.Internal where

import Control.Monad.Eff.Exception as Exception

exception :: String -> Exception.Error
exception = Exception.error
