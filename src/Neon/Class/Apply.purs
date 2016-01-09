module Neon.Class.Apply (Apply, apply) where

import Prelude as Prelude

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply fs xs = Prelude.apply fs xs
