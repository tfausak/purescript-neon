module Neon.Class.Chain where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class Chain a where
  chain :: forall b c. (b -> a c) -> a b -> a c

instance chainArray :: Chain Array where
  chain f xs = Prelude.bind xs f

instance chainEff :: Chain (Effect.Eff a) where
  chain f xs = Prelude.bind xs f

instance chainList :: Chain Data.List where
  chain f xs = Prelude.bind xs f

instance chainMaybe :: Chain Data.Maybe where
  chain f mx = Prelude.bind mx f
