module Neon.Types.HasIdentity
  ( HasIdentity
  , identity
  ) where

import Neon.Types.HasCompose (HasCompose)

-- | Laws:
-- | - HasIdentity: `f >> identity = identity >> f = f`
class (HasCompose f) <= HasIdentity f where
  identity :: forall a. f a a

instance identityFunction :: HasIdentity Function where
  identity = \ x -> x
