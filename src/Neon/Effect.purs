-- | Types and functions for dealing with effects. Includes synchronous effects
-- | (`Eff`) as well as effectful types (like `CONSOLE`).
module Neon.Effect
  ( module Neon.Effect
  , module Export
  ) where

import Control.Monad.Eff (Eff, runPure) as Export
import Control.Monad.Eff.Console (CONSOLE, error, log) as Export
import Control.Monad.Eff.Exception (EXCEPTION) as Export
import Control.Monad.Eff.Random (RANDOM) as Export
import Control.Monad.Eff.Unsafe (unsafePerformEff) as Export

import Control.Monad.Eff as Eff
import Control.Monad.Eff.Exception as Exception

-- | Catches an exception by providing and exception handler. The handler
-- | removes the `EXCEPTION` effect.
-- |
-- | ``` purescript
-- | catch (\ x -> error x) (throw (exception "example")))
-- | ```
catch :: forall a b. (Exception.Error -> Eff.Eff b a) -> Eff.Eff (exception :: Exception.EXCEPTION | b) a -> Eff.Eff b a
catch = Exception.catchException

-- | Throws an exception.
-- |
-- | ``` purescript
-- | throw (exception "example"))
-- | ```
throw :: forall a b. Exception.Error -> Eff.Eff (exception :: Exception.EXCEPTION | b) a
throw = Exception.throwException
