module Neon.Class.Apply (Apply, apply) where

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c
