module Neon.Types.HasTraverse
  ( HasTraverse
  , traverse
  ) where

import Neon.Types.HasApply ((<*>))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasPure (HasPure, pure)
import Neon.Values.List (List(Nil, Cons), toList, fromList)
import Neon.Values.Maybe (Maybe(Nothing, Just))

class (HasFold t, HasMap t) <= HasTraverse t where
  traverse :: forall a b m. (HasPure m) => (a -> m b) -> t a -> m (t b)

instance arrayHasTraverse :: HasTraverse Array where
  traverse f x = fromList <$> traverse f (toList x)

instance listHasTraverse :: HasTraverse List where
  traverse f xs = case xs of
    Nil -> pure Nil
    Cons x l -> Cons <$> f x <*> traverse f l

instance maybeHasTraverse :: HasTraverse Maybe where
  traverse f x = case x of
    Nothing -> pure Nothing
    Just j -> pure <$> f j
