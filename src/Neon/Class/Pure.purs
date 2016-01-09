module Neon.Class.Pure (Pure, pure) where

import Prelude as Prelude

class Pure a where
  pure :: forall b. b -> a b

instance pureArray :: Pure Array where
  pure x = Prelude.pure x
