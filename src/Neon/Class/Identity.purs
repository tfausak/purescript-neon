module Neon.Class.Identity (Identity, identity) where

class Identity a where
  identity :: forall b. a b b

instance identityFunction :: Identity Function where
  identity = \ x -> x
