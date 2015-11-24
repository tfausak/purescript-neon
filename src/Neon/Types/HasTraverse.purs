module Neon.Types.HasTraverse
  ( HasTraverse
  , sequence
  , traverse
  ) where

import Neon.Types.HasApply ((<*>))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasIdentity (identity)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasPure (HasPure, pure)
import Neon.Types.HasToArray (toArray)
import Neon.Values.List (List(Nil, Cons), toList)
import Neon.Values.Maybe (Maybe(Nothing, Just))

-- | Represents data structures that can be traversed from left to right.
-- | Unlike `HasFold`, these structures can be traversed while keeping their
-- | shape.
-- |
-- | Laws:
-- | - Naturality: `t >> traverse f = traverse (t >> f)`
-- | - Identity: `traverse Identity = Identity`
-- | - Composition: TODO
class (HasFold t, HasMap t) <= HasTraverse t where
  -- | Map each element of a structure to an action, evaluate these actions
  -- | from left to right, and collect the results.
  -- |
  -- | ``` purescript
  -- | traverse (show >> Just) [1, 2]
  -- | -- Just ["1", "2"]
  -- | ```
  traverse :: forall a b m. (HasPure m) => (a -> m b) -> t a -> m (t b)

instance arrayHasTraverse :: HasTraverse Array where
  traverse f x = toArray <$> traverse f (toList x)

instance listHasTraverse :: HasTraverse List where
  traverse f xs = case xs of
    Nil -> pure Nil
    Cons x l -> Cons <$> f x <*> traverse f l

instance maybeHasTraverse :: HasTraverse Maybe where
  traverse f x = case x of
    Nothing -> pure Nothing
    Just j -> pure <$> f j

-- | Evaluates actions from left to right and collects the results.
-- |
-- | ``` purescript
-- | sequence [Just 1, Just 2]
-- | -- Just [1, 2]
-- | ```
sequence :: forall t m a. (HasPure m, HasTraverse t) => t (m a) -> m (t a)
sequence = traverse identity
