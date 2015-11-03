module Neon.Types.HasEmpty
  ( HasEmpty
  , empty
  ) where

import Neon.Types.HasAlternative (HasAlternative)

-- | Laws:
-- | - Left identity: `empty <|> x == x`
-- | - Right identity: `x <|> empty == x`
-- | - Annihilation: `f <$> empty == empty`
class (HasAlternative f) <= HasEmpty f where
  empty :: forall a. f a

instance emptyArray :: HasEmpty Array where
  empty = []
