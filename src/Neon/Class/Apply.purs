module Neon.Class.Apply (Apply, apply) where

import Neon.Data (List())
import Prelude as Prelude

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply fs xs = Prelude.apply fs xs

instance applyList :: Apply List where
  apply fs xs = Prelude.apply fs xs
