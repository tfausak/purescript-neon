module Neon.Types.HasEmpty
  ( HasEmpty
  , empty
  , guard
  ) where

import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Unit (Unit(), unit)

-- | Represents types that can be empty. This is like `HasZero` but for types
-- | of kind `* -> *` instead of `*`.
-- |
-- | Laws:
-- | - Left identity: `alternative empty x == x`
-- | - Right identity: `alternative x empty == x`
-- | - Annihilation: `map f empty == empty`
class (HasAlternative f) <= HasEmpty f where
  -- | An empty container. This is like `zero` but for higher-kinded types.
  -- |
  -- | ``` purescript
  -- | empty
  -- | -- []
  -- | ```
  empty :: forall a. f a

instance arrayHasEmpty :: HasEmpty Array where
  empty = []

-- | If the condition is `false`, returns `empty`. Otherwise returns
-- | `pure unit`. This is useful for stopping some action part-way through.
-- |
-- | ``` purescript
-- | guard false
-- | -- []
-- | guard true
-- | -- [unit]
-- | ```
guard :: forall f. (HasEmpty f, HasPure f) => Boolean -> f Unit
guard p = if p then pure unit else empty
