module Neon.Class.Apply where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply f x = Prelude.apply f x

instance applyEff :: Apply (Effect.Eff a) where
  apply f x = Prelude.apply f x

instance applyList :: Apply Data.List where
  apply f x = Prelude.apply f x

instance applyMaybe :: Apply Data.Maybe where
  apply f x = Prelude.apply f x
