module Neon.Types.HasLift
  ( HasLift
  , lift
  ) where

import Neon.Types.HasBind (HasBind)

-- | Represents types that support being lifted into a stack of
-- | [monad transformers](https://en.wikipedia.org/wiki/Monad_transformer).
-- |
-- | Laws:
-- | - `lift (pure x) = pure x`
-- | - `lift (bind m (\ x -> y)) = bind (lift m) (\ x -> lift y)`
class HasLift t where
  -- | Lifts a monadic action into the monad transformer.
  -- |
  -- | ``` purescript
  -- | runMaybeT (lift (Just 1))
  -- | -- Identity (Just 1)
  -- | ```
  lift :: forall m a. (HasBind m) => m a -> t m a
