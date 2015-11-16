module Neon.Types.HasLogarithm
  ( HasLogarithm
  , logarithm
  ) where

import Neon.Types.HasDivide (HasDivide)
import Neon.Types.HasPower (HasPower)

foreign import nativeLogarithmInt :: Int -> Int -> Int
foreign import nativeLogarithmNumber :: Number -> Number -> Number

-- | Represents types that support logarithms.
-- |
-- | Laws:
-- | - `logarithm b (x * y) = logarithm b x + logarithm b y`
-- | - `logarithm b (x / y) = logarithm b x - logarithm b y`
-- | - `logarithm b (x ^ y) = y * logarithm b x`
class (HasDivide a, HasPower a) <= HasLogarithm a where
  -- | Takes the logarithm of a value in some base.
  -- |
  -- | ``` purescript
  -- | logarithm 2 8
  -- | -- 3
  -- | ```
  logarithm :: a -> a -> a

instance intHasLogarithm :: HasLogarithm Int where
  logarithm b x = nativeLogarithmInt b x

instance numberHasLogarithm :: HasLogarithm Number where
  logarithm b x = nativeLogarithmNumber b x
