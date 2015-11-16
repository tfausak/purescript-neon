module Neon.Types.HasExtract
  ( HasExtract
  , extract
  ) where

import Neon.Types.HasExtend (HasExtend)

-- | TODO
-- |
-- | Laws:
-- | - Left identity: `extract <<= xs = xs`
-- | - Right identity: `extract (f <<= xs) = f xs`
class (HasExtend w) <= HasExtract w where
  -- | TODO
  -- |
  -- | ``` purescript
  -- | TODO
  -- | -- TODO
  -- | ```
  extract :: forall a. w a -> a
