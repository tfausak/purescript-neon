module Neon.Types.HasEmpty
  ( HasEmpty
  , empty
  , guard
  ) where

import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Unit (Unit(), unit)

-- | Laws:
-- | - Left identity: `empty <|> x == x`
-- | - Right identity: `x <|> empty == x`
-- | - Annihilation: `f <$> empty == empty`
class (HasAlternative f) <= HasEmpty f where
  empty :: forall a. f a

instance arrayHasEmpty :: HasEmpty Array where
  empty = []

guard :: forall f. (HasEmpty f, HasPure f) => Boolean -> f Unit
guard p = if p then pure unit else empty
