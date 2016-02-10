module Neon.Data
  ( module Neon.Data
  , module Export
  ) where

import Control.Monad.Eff.Exception (Error) as Export
import Data.List (List(Nil, Cons)) as Export
import Data.Maybe (Maybe(Nothing, Just)) as Export
import Data.Tuple (Tuple(Tuple)) as Export
import Prelude (Unit, unit) as Export

import Control.Monad.Eff.Exception as Exception

exception :: String -> Exception.Error
exception x = Exception.error x
