module Neon.Class.HasChain where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

class HasChain a where
  chain :: forall b c. (b -> a c) -> a b -> a c

instance arrayHasChain :: HasChain Array where
  chain f xs = Prelude.bind xs f

instance effHasChain :: HasChain (Effect.Eff a) where
  chain f xs = Prelude.bind xs f

instance listHasChain :: HasChain Data.List where
  chain f xs = Prelude.bind xs f

instance maybeHasChain :: HasChain Data.Maybe where
  chain f mx = Prelude.bind mx f
