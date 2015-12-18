module Neon.Class.Always (class Always, always) where

class Always a where
  always :: forall b c. a b (a c b)

instance alwaysFunction :: Always Function where
  always x = \ _ -> x
