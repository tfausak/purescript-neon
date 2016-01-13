module Neon.Effect.Internal
  ( catch
  , throw
  ) where

import Control.Monad.Eff (..) as Eff
import Control.Monad.Eff.Exception (..) as Exception

catch :: forall a b. (Exception.Error -> Eff.Eff b a) -> Eff.Eff (err :: Exception.EXCEPTION | b) a -> Eff.Eff b a
catch = Exception.catchException

throw :: forall a b. Exception.Error -> Eff.Eff (err :: Exception.EXCEPTION | b) a
throw = Exception.throwException
