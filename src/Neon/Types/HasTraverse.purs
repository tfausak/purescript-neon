module Neon.Types.HasTraverse
  ( HasTraverse
  , traverse
  ) where

import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.Maybe (Maybe(Nothing, Just))

foreign import nativeTraverseArray :: forall a b m. (HasPure m) => (a -> m b) -> Array a -> m (Array b)

class (HasFold t, HasMap t) <= HasTraverse t where
  traverse :: forall a b m. (HasPure m) => (a -> m b) -> t a -> m (t b)

instance arrayHasTraverse :: HasTraverse Array where
  traverse f x = nativeTraverseArray f x

instance maybeHasTraverse :: HasTraverse Maybe where
  traverse f x = case x of
    Nothing -> pure Nothing
    Just j -> pure <$> f j
