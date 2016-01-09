module Neon.Class.Compose (Compose, compose) where

import Prelude as Prelude

class Compose a where
  compose :: forall b c d. a c d -> a b c -> a b d

instance composeFunction :: Compose Function where
  compose g f = Prelude.compose g f
