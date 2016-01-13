module Neon.Data.Internal
  ( exception
  ) where

import Control.Monad.Eff.Exception (..) as Exception

exception :: String -> Exception.Error
exception = Exception.error
