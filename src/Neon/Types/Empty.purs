module Neon.Types.Empty
  ( Empty
  , empty
  ) where

import Neon.Types.Alternative (Alternative)

-- | Laws:
-- | - Left identity: `empty <|> x == x`
-- | - Right identity: `x <|> empty == x`
-- | - Annihilation: `f <$> empty == empty`
class (Alternative f) <= Empty f where
  empty :: forall a. f a

instance emptyArray :: Empty Array where
  empty = []
