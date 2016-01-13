module Neon.Class.Chain (class Chain, chain) where

import Neon.Data (List, Maybe)
import Neon.Effect (Eff)
import Prelude (..) as Prelude

-- | Represents types that can express sequential actions. This is also known
-- | as a [monad](https://en.wikipedia.org/wiki/Monad_(functional_programming)).
-- |
-- | ``` purescript
-- | chain (\ x -> [x, x * 2]) [3, 5] -- [3, 6, 5, 10]
-- | ```
-- |
-- | Laws:
-- | - `bind (bind x f) g = bind x (\ k -> bind (f k) g)`
class Chain a where
  chain :: forall b c. (b -> a c) -> a b -> a c

instance chainArray :: Chain Array where
  chain f xs = Prelude.bind xs f

instance chainEff :: Chain (Eff a) where
  chain f xs = Prelude.bind xs f

instance chainList :: Chain List where
  chain f xs = Prelude.bind xs f

instance chainMaybe :: Chain Maybe where
  chain f mx = Prelude.bind mx f
