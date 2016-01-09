module Neon.Class.Chain (Chain, chain) where

import Neon.Data (List())
import Neon.Effect (Eff())
import Prelude as Prelude

class Chain a where
  chain :: forall b c. (b -> a c) -> a b -> a c

instance chainArray :: Chain Array where
  chain f xs = Prelude.bind xs f

instance chainEff :: Chain (Eff a) where
  chain f xs = Prelude.bind xs f

instance chainList :: Chain List where
  chain f xs = Prelude.bind xs f
