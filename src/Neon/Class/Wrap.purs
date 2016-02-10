module Neon.Class.Wrap where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class Wrap a where
  wrap :: forall b. b -> a b

instance wrapArray :: Wrap Array where
  wrap x = Prelude.pure x

instance wrapEff :: Wrap (Effect.Eff a) where
  wrap x = Prelude.pure x

instance wrapMaybe :: Wrap Data.Maybe where
  wrap x = Prelude.pure x
