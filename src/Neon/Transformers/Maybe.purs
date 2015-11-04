module Neon.Transformers.Maybe
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
import Neon.Values.Maybe (Maybe(Just, Nothing))

newtype MaybeT m a = MaybeT (m (Maybe a))

-- TODO: Can this be written with only a "HasApply" constraint?
instance maybeTHasAlternative :: (HasBind m) => HasAlternative (MaybeT m) where
  alternative m1 m2 = MaybeT do
    x <- runMaybeT m1
    case x of
      Just _ -> pure x
      Nothing -> runMaybeT m2

-- TODO: There has to be a better way to write this. Is it possible to write
--   with only a "HasApply" constraint?
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

-- TODO: If alternative instance doesn't use bind, this doesn't either.
instance maybeTHasEmpty :: (HasBind m) => HasEmpty (MaybeT m) where
  empty = MaybeT (pure empty)

instance maybeTHasLift :: HasLift MaybeT where
  lift x = MaybeT (x >>= pure >> pure)

instance maybeTHasMap :: (HasMap m) => HasMap (MaybeT m) where
  map f (MaybeT x) = MaybeT (map (map f) x)

-- TODO: If the "HasApply" instance only uses "HasApply", this only needs
--   "HasPure".
instance maybeTHasPure :: (HasBind m) => HasPure (MaybeT m) where
  pure x = MaybeT (pure (pure x))

runMaybeT :: forall m a. MaybeT m a -> m (Maybe a)
runMaybeT (MaybeT x) = x
