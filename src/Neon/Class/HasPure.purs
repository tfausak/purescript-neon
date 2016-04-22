module Neon.Class.HasPure where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class HasPure a where
  pure :: forall b. b -> a b

instance arrayHasPure :: HasPure Array where
  pure x = Prelude.pure x

instance effHasPure :: HasPure (Effect.Eff a) where
  pure x = Prelude.pure x

instance listHasPure :: HasPure Data.List where
  pure x = Prelude.pure x

instance maybeHasPure :: HasPure Data.Maybe where
  pure x = Prelude.pure x
