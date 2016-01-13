module Neon.Effect
  ( module Neon.Effect
  , module X
  ) where

import Control.Monad.Eff (Eff(), runPure) as X
import Control.Monad.Eff.Console (CONSOLE(), error, log) as X
import Control.Monad.Eff.Exception (EXCEPTION()) as X
import Control.Monad.Eff.Unsafe (unsafePerformEff) as X

import Control.Monad.Eff as Eff
import Control.Monad.Eff.Exception as Exception

catch :: forall a b. (Exception.Error -> Eff.Eff b a) -> Eff.Eff (err :: Exception.EXCEPTION | b) a -> Eff.Eff b a
catch = Exception.catchException

throw :: forall a b. Exception.Error -> Eff.Eff (err :: Exception.EXCEPTION | b) a
throw = Exception.throwException
