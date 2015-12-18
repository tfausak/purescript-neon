module Neon.Class.Compose (class Compose, compose) where

class Compose a where
  compose :: forall b c d. a b c -> a c d -> a b d

instance composeFunction :: Compose Function where
  compose f g = \ x -> g (f x)
