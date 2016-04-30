-- | Data types and constructors.
module Neon.Data
  ( module Neon.Data
  , module Export
  ) where

import Control.Monad.Eff.Exception (Error) as Export
import Data.List (List(Nil, Cons)) as Export
import Data.Maybe (Maybe(Nothing, Just)) as Export
import Data.Tuple (Tuple(Tuple)) as Export
import Prelude (Ordering(EQ, GT, LT), Unit, unit) as Export
import Type.Proxy (Proxy(Proxy)) as Export

import Control.Monad.Eff.Exception as Exception

-- | Creates an exception with the given message.
-- |
-- | ``` purescript
-- | exception "example"
-- | ```
exception :: String -> Exception.Error
exception x = Exception.error x
