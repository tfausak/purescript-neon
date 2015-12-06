module Neon.Class.Pure (Pure, pure) where

class Pure a where
  pure :: forall b. b -> a b

instance pureArray :: Pure Array where
  pure x = [x]
