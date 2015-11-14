module Neon.Types.HasPower
  ( HasPower
  , power
  , (^)
  ) where

import Neon.Types.HasOne (HasOne)

foreign import nativePowerInt :: Int -> Int -> Int
foreign import nativePowerNumber :: Number -> Number -> Number

-- | Laws:
-- | - `(b ^ n) * (b ^ m) = b ^ (n + m)`
-- | - `(b ^ n) ^ m = b ^ (n * m)`
-- | - `(b * y) ^ n = (b ^ n) * (y ^ n)`
class (HasOne a) <= HasPower a where
  power :: a -> a -> a

-- NOTE: Negative integers make this instance not law-abiding.
instance intHasPower :: HasPower Int where
  power b n = nativePowerInt b n

instance numberHasPower :: HasPower Number where
  power b n = nativePowerNumber b n

(^) :: forall a. (HasPower a) => a -> a -> a
(^) b n = power b n
infixr 8 ^
