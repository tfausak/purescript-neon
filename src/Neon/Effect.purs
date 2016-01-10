module Neon.Effect
  ( module Control.Monad.Eff
  , module Control.Monad.Eff.Console
  , module Control.Monad.Eff.Exception
  , module Control.Monad.Eff.Unsafe
  ) where

import Control.Monad.Eff (Eff(), runPure)
import Control.Monad.Eff.Console (CONSOLE(), log)
import Control.Monad.Eff.Exception (EXCEPTION(), catchException, throwException)
import Control.Monad.Eff.Unsafe (unsafePerformEff)
