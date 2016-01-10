module Neon.Class.Apply (Apply, apply) where

import Neon.Data (List(), Maybe())
import Prelude as Prelude

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply fs xs = Prelude.apply fs xs

instance applyList :: Apply List where
  apply fs xs = Prelude.apply fs xs

instance applyMaybe :: Apply Maybe where
  apply mf mx = Prelude.apply mf mx
