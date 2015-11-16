module Neon.Types.HasLogBase
  ( HasLogBase
  , logBase
  ) where

import Neon.Types.HasDivide (HasDivide)
import Neon.Types.HasPower (HasPower)

foreign import nativeLogBaseInt :: Int -> Int -> Int
foreign import nativeLogBaseNumber :: Number -> Number -> Number

-- | Represents types that support logarithms.
-- |
-- | Laws:
-- | - `logBase b (x * y) = logBase b x + logBase b y`
-- | - `logBase b (x / y) = logBase b x - logBase b y`
-- | - `logBase b (x ^ y) = y * logBase b x`
class (HasDivide a, HasPower a) <= HasLogBase a where
  -- | Takes the logarithm of a value in some base.
  -- |
  -- | ``` purescript
  -- | logBase 2 8
  -- | -- 3
  -- | ```
  logBase :: a -> a -> a

instance intHasLogBase :: HasLogBase Int where
  logBase b x = nativeLogBaseInt b x

instance numberHasLogBase :: HasLogBase Number where
  logBase b x = nativeLogBaseNumber b x
