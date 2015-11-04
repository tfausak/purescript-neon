module Neon.Types.HasLift
  ( HasLift
  , lift
  ) where

import Neon.Types.HasBind (HasBind)

-- | Laws:
-- | - `lift (pure x) = pure x`
-- | - `lift (m >>= \ x -> y) = lift m >>= \ x -> lift y`
class HasLift t where
  lift :: forall m a. (HasBind m) => m a -> t m a
