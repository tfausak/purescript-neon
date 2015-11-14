module Neon.Types.HasState
  ( HasState
  , state
  , getState
  , setState
  ) where

import Neon.Primitives.Function (always, (|>))
import Neon.Types.HasBind (HasBind)
import Neon.Values.Pair (Pair(), pair)
import Neon.Values.Unit (Unit(), unit)

-- | Laws:
-- | - `do { getState ; getState } = getState`
-- | - `do { setState x ; setState y } = setState y`
-- | - `do { setState x ; getState } = setState x $> x`
-- | - `do { s <- getState ; setState s } = pure unit`
class (HasBind m) <= HasState s m where
  state :: forall a. (s -> (Pair a s)) -> m a

getState :: forall m s. (HasState s m) => m s
getState = state \ x -> pair x x

setState :: forall m s. (HasState s m) => s -> m Unit
setState x = x |> pair unit |> always |> state
