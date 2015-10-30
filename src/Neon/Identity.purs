module Neon.Identity
  ( Identity
  , identity
  ) where

import Neon.Compose (Compose)

class (Compose f) <= Identity f where
  identity :: forall a. f a a

instance identityFunction :: Identity Function where
  identity = \ x -> x
