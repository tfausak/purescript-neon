module Neon.Data
  ( module Neon.Data
  , module X
  ) where

import Control.Monad.Eff.Exception (Error()) as X
import Data.List (List(Nil, Cons)) as X
import Data.Maybe (Maybe(Nothing, Just)) as X
import Data.Tuple (Tuple(Tuple)) as X
import Prelude (Unit(), unit) as X

import Control.Monad.Eff.Exception as Exception

exception :: String -> Exception.Error
exception = Exception.error
