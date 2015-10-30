module Neon.Identity
  ( Identity
  , identity
  ) where

import Neon.Compose (Compose)

-- | Laws:
-- | - Identity: `f >> identity = identity >> f = f`
class (Compose f) <= Identity f where
  identity :: forall a. f a a

instance identityFunction :: Identity Function where
  identity = \ x -> x
