module Neon.Transformers.StateT
  ( StateT(StateT)
  , runStateT
  ) where

import Neon.Types.HasAlternative (HasAlternative, (<|>))
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind, bind, (>>=))
import Neon.Types.HasEmpty (HasEmpty, empty)
import Neon.Types.HasLift
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Pair (Pair(Pair), pair)

newtype StateT s m a = StateT (s -> m (Pair a s))

instance stateTHasAlternative :: (HasAlternative m, HasBind m) => HasAlternative (StateT s m) where
  alternative (StateT f) (StateT g) = StateT \ x -> f x <|> g x

-- TODO: Possible to write with only "HasApply" constraint?
instance stateTHasApply :: (HasBind m) => HasApply (StateT s m) where
  apply (StateT f) (StateT x) = StateT \ y -> do
    Pair g <- f y
    Pair z <- x g.second
    pure (pair (g.first z.first) z.second)

instance stateTHasBind :: (HasBind m) => HasBind (StateT s m) where
  bind (StateT x) f = StateT \ y -> do
    Pair p <- x y
    runStateT (f p.first) p.second

instance stateTHasMap :: (HasMap m) => HasMap (StateT s m) where
  map g (StateT f) = StateT \ x ->
    map (\ (Pair p) -> pair (g p.first) p.second) (f x)

instance stateTHasEmpty :: (HasBind m, HasEmpty m) => HasEmpty (StateT s m) where
  empty = StateT \ _ -> empty

instance stateTHasLift :: HasLift (StateT s) where
  lift m = StateT \ x -> m >>= \ y -> pure (pair y x)

-- TODO: Only use "HasPure" if "stateTHasApply" only uses "HasApply".
instance stateTHasPure :: (HasBind m) => HasPure (StateT s m) where
  pure x = StateT \ y -> pure (pair x y)

runStateT :: forall s m a. StateT s m a -> s -> m (Pair a s)
runStateT (StateT f) x = f x
