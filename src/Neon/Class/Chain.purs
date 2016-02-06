module Neon.Class.Chain where

import Neon.Data as Data
import Neon.Effect as Effect
import Prelude as Prelude

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

instance chainEff :: Chain (Effect.Eff a) where
  chain f xs = Prelude.bind xs f

instance chainList :: Chain Data.List where
  chain f xs = Prelude.bind xs f

instance chainMaybe :: Chain Data.Maybe where
  chain f mx = Prelude.bind mx f
