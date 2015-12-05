module Neon.Class.Bind (Bind, bind) where

class Bind a where
  bind :: forall b c. a b -> (b -> a c) -> a c
