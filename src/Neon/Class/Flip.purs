module Neon.Class.Flip (Flip, flip) where

class Flip a where
  flip :: forall b c d. a b (a c d) -> a c (a b d)

instance flipFunction :: Flip Function where
  flip f = \ x y -> f y x
