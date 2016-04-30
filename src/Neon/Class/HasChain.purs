module Neon.Class.HasChain where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

-- | Represents types that can express sequential actions. This is also known
-- | as a [monad](https://en.wikipedia.org/wiki/Monad_(functional_programming)).
-- |
-- | ``` purescript
-- | [3, 5] :chain (\ x -> [x, x * 2]) -- [3, 6, 5, 10]
-- | ```
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
