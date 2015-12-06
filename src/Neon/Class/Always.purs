module Neon.Class.Always (Always, always) where

class Always a where
  always :: forall b c. a b (a c b)

instance alwaysFunction :: Always Function where
  always x = \ _ -> x
