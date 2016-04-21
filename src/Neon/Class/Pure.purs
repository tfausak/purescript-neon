module Neon.Class.Pure where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class Pure a where
  pure :: forall b. b -> a b

instance pureArray :: Pure Array where
  pure x = Prelude.pure x

instance pureEff :: Pure (Effect.Eff a) where
  pure x = Prelude.pure x

instance pureList :: Pure Data.List where
  pure x = Prelude.pure x

instance pureMaybe :: Pure Data.Maybe where
  pure x = Prelude.pure x
