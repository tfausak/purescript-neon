module Neon.Types.HasState
  ( HasState
  , getState
  , setState
  , state
  ) where

import Neon.Primitives.Function (always, (|>))
import Neon.Types.HasBind (HasBind)
import Neon.Values.Pair (Pair(), pair)
import Neon.Values.Unit (Unit(), unit)

-- | Represents monads that contain "mutable" state.
-- |
-- | Laws:
-- | - `do { getState ; getState } = getState`
-- | - `do { setState x ; setState y } = setState y`
-- | - `do { setState x ; getState } = map (always x) (setState x)`
-- | - `do { s <- getState ; setState s } = pure unit`
class (HasBind m) <= HasState s m where
  -- | Updates the state.
  -- |
  -- | ``` purescript
  -- | runStateT (state \ x -> pair (x - 1) (x + 1)) 2
  -- | -- Identity (pair 1 3)
  -- | ```
  state :: forall a. (s -> (Pair a s)) -> m a

-- | Gets the state.
-- |
-- | ``` purescript
-- | runStateT getState 1
-- | -- Identity (pair 1 1)
-- | ```
getState :: forall m s. (HasState s m) => m s
getState = state \ x -> pair x x

-- | Sets the state.
-- |
-- | ``` purescript
-- | runStateT (setState 2) 1
-- | -- Identity (pair unit 2)
-- | ```
setState :: forall m s. (HasState s m) => s -> m Unit
setState x = x |> pair unit |> always |> state
