module Neon.Transformers.MaybeT
  ( MaybeT(MaybeT)
  , runMaybeT
  ) where

import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasApply (HasApply, apply)
import Neon.Types.HasBind (HasBind, bind, (>>=))
import Neon.Types.HasCompose ((>>))
import Neon.Types.HasEmpty (HasEmpty, empty)
import Neon.Types.HasLift (HasLift)
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Maybe (Maybe(Just, Nothing), maybe)

-- | The "maybe" monad transformer. Extends any monad with failure via the
-- | `Maybe` type.
newtype MaybeT m a = MaybeT (m (Maybe a))

instance maybeTHasAlternative :: (HasBind m) => HasAlternative (MaybeT m) where
  alternative (MaybeT x) (MaybeT y) = MaybeT (x >>= maybe y (pure >> pure))

-- TODO: #15
instance maybeTHasApply :: (HasBind m) => HasApply (MaybeT m) where
  apply (MaybeT f) (MaybeT x) = MaybeT do
    g <- f
    y <- x
    pure (apply g y)

instance maybeTHasBind :: (HasBind m) => HasBind (MaybeT m) where
  bind x f = MaybeT do
    y <- runMaybeT x
    case y of
      Just z -> runMaybeT (f z)
      Nothing -> pure Nothing

instance maybeTHasEmpty :: (HasBind m) => HasEmpty (MaybeT m) where
  empty = MaybeT (pure empty)

instance maybeTHasLift :: HasLift MaybeT where
  lift x = MaybeT (x >>= pure >> pure)

instance maybeTHasMap :: (HasMap m) => HasMap (MaybeT m) where
  map f (MaybeT x) = MaybeT (map (map f) x)

-- TODO: #15
instance maybeTHasPure :: (HasBind m) => HasPure (MaybeT m) where
  pure x = MaybeT (pure (pure x))

-- | Runs a "maybe" monad transformer, returning the `Maybe` value in the
-- | wrapped monad.
-- |
-- | ``` purescript
-- | runMaybeT do
-- |   Just 1
-- |   Nothing
-- |   Just 1
-- | -- Identity Nothing
-- | ```
runMaybeT :: forall m a. MaybeT m a -> m (Maybe a)
runMaybeT (MaybeT x) = x
