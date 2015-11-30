module Neon.Transformers.StateT
  ( StateT(StateT)
  , runStateT
  ) where

import Neon.Types.HasAlternative (HasAlternative, alternative)
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind, bind)
import Neon.Types.HasCompose ((>>))
import Neon.Types.HasEmpty (HasEmpty, empty)
import Neon.Types.HasLift (HasLift)
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Types.HasState (HasState)
import Neon.Values.Pair (Pair(Pair), pair)

-- | The "state" monad transformer. Extends any monad with state via the `Pair`
-- | type.
newtype StateT s m a = StateT (s -> m (Pair a s))

instance stateTHasAlternative :: (HasAlternative m, HasBind m) => HasAlternative (StateT s m) where
  alternative (StateT f) (StateT g) = StateT \ x -> alternative (f x) (g x)

-- TODO: #15
instance stateTHasApply :: (HasBind m) => HasApply (StateT s m) where
  apply (StateT f) (StateT x) = StateT \ y -> do
    Pair g <- f y
    Pair z <- x g.second
    pure (pair (g.first z.first) z.second)

instance stateTHasBind :: (HasBind m) => HasBind (StateT s m) where
  bind (StateT x) f = StateT \ y -> do
    Pair p <- x y
    runStateT (f p.first) p.second

instance stateTHasEmpty :: (HasBind m, HasEmpty m) => HasEmpty (StateT s m) where
  empty = StateT \ _ -> empty

instance stateTHasLift :: HasLift (StateT s) where
  lift m = StateT \ x -> bind m (\ y -> pure (pair y x))

instance stateTHasMap :: (HasMap m) => HasMap (StateT s m) where
  map g (StateT f) = StateT \ x ->
    map (\ (Pair p) -> pair (g p.first) p.second) (f x)

-- TODO: #15
instance stateTHasPure :: (HasBind m) => HasPure (StateT s m) where
  pure x = StateT \ y -> pure (pair x y)

instance stateTHasState :: (HasBind m) => HasState s (StateT s m) where
  state f = StateT (f >> pure)

-- | Runs a "state" monad transformer, returning the stateful value and the
-- | result in the wrapped monad.
-- |
-- | ``` purescript
-- | flip runStateT "world"" do
-- |   pure "hello"
-- | -- Identity (pair "hello" "world")
-- | ```
runStateT :: forall s m a. StateT s m a -> s -> m (Pair a s)
runStateT (StateT f) x = f x
