module Neon.Types.HasPower
  ( HasPower
  , power
  , (^)
  ) where

import Neon.Types.HasOne (HasOne)

foreign import nativePowerInt :: Int -> Int -> Int
foreign import nativePowerNumber :: Number -> Number -> Number

-- | Represents types that can be exponentiated.
-- |
-- | Laws:
-- | - `(b ^ n) * (b ^ m) = b ^ (n + m)`
-- | - `(b ^ n) ^ m = b ^ (n * m)`
-- | - `(b * y) ^ n = (b ^ n) * (y ^ n)`
class (HasOne a) <= HasPower a where
  -- | Raises a value raised to the power of another value.
  -- |
  -- | ``` purescript
  -- | power 2 3
  -- | -- 8
  -- | ```
  power :: a -> a -> a

-- NOTE: Negative integers make this instance not law-abiding.
instance intHasPower :: HasPower Int where
  power b n = nativePowerInt b n

instance numberHasPower :: HasPower Number where
  power b n = nativePowerNumber b n

-- | Alias for `power`.
-- |
-- | ``` purescript
-- | 2 ^ 3
-- | -- 8
-- | ```
(^) :: forall a. (HasPower a) => a -> a -> a
(^) b n = power b n
infixr 8 ^
