module Neon.Class.Apply (class Apply, apply) where

import Neon.Data (List, Maybe)
import Neon.Effect (Eff)
import Prelude as Prelude

-- | Represents types that can be applied from within a container. In other
-- | words, given both a function and a value in a container, apply the
-- | function to the value and return the result in a container. This is also
-- | known as an applicative functor.
-- |
-- | ``` purescript
-- | apply [(+ 2), (* 2)] [3, 4] -- [5, 6, 6, 8]
-- | apply (Just (+ 1)) (Just 2) -- Just 3
-- | ```
-- |
-- | Laws:
-- | - `apply (apply (map compose f) g) h = apply f (apply g h)`
class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply fs xs = Prelude.apply fs xs

instance applyEff :: Apply (Eff a) where
  apply f x = Prelude.apply f x

instance applyList :: Apply List where
  apply fs xs = Prelude.apply fs xs

instance applyMaybe :: Apply Maybe where
  apply mf mx = Prelude.apply mf mx
