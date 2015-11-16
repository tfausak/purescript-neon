module Neon.Types.HasIdentity
  ( HasIdentity
  , identity
  ) where

import Neon.Types.HasCompose (HasCompose)

-- | Represents types that have an identity morphism. This is also known as a
-- | [category](https://en.wikipedia.org/wiki/Category_(mathematics)).
-- |
-- | Laws:
-- | - Identity: `f >> identity = identity >> f = f`
class (HasCompose f) <= HasIdentity f where
  -- | The identity morphism. This is most commonly used as the identity
  -- | function.
  -- |
  -- | ``` purescript
  -- | identity unit
  -- | -- unit
  -- | ```
  identity :: forall a. f a a

instance functionHasIdentity :: HasIdentity Function where
  identity = \ x -> x
