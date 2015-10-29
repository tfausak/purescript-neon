module Ax.Identity
  ( Identity
  , identity
  ) where

import Ax.Compose (Compose)

class (Compose f) <= Identity f where
  identity :: forall a. f a a

instance identityFunction :: Identity Function where
  identity = \ x -> x
