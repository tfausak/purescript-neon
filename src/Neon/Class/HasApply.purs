module Neon.Class.HasApply where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class HasApply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance arrayHasApply :: HasApply Array where
  apply f x = Prelude.apply f x

instance effHasApply :: HasApply (Effect.Eff a) where
  apply f x = Prelude.apply f x

instance listHasApply :: HasApply Data.List where
  apply f x = Prelude.apply f x

instance maybeHasApply :: HasApply Data.Maybe where
  apply f x = Prelude.apply f x
