module Neon.Types.HasTraverse
  ( HasTraverse
  , traverse
  ) where

import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Maybe (Maybe(Nothing, Just))

class (HasFold t, HasMap t) <= HasTraverse t where
  traverse :: forall a b m. (HasPure m) => (a -> m b) -> t a -> m (t b)

instance maybeHasTraverse :: HasTraverse Maybe where
  traverse f x = case x of
    Nothing -> pure Nothing
    Just j -> pure <$> f j
