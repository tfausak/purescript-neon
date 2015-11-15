module Neon.Types.HasDivide
  ( HasDivide
  , divide
  , modulo
  , reciprocal
  , (/)
  , (%)
  ) where

import Neon.Types.HasOne (HasOne, one)

foreign import nativeDivideInt :: Int -> Int -> Int
foreign import nativeModuloInt :: Int -> Int -> Int
foreign import nativeDivideNumber :: Number -> Number -> Number

-- | Represents types that are divisible.
-- |
-- | Laws:
-- | - Remainder: `(x / y) * y + (x % y) = x`
-- | - Identity: `x / one = x`
class (HasOne a) <= HasDivide a where
  -- | Divides one value by another.
  -- |
  -- | ``` purescript
  -- | divide 5 2
  -- | -- 2
  -- | ```
  divide :: a -> a -> a

  -- | Returns the remainder after division.
  -- |
  -- | ``` purescript
  -- | modulo 5 2
  -- | -- 1
  -- | ```
  modulo :: a -> a -> a

instance functionHasDivide :: (HasDivide b) => HasDivide (a -> b) where
  divide f g = \ x -> f x / g x
  modulo f g = \ x -> f x % g x

instance intHasDivide :: HasDivide Int where
  divide x y = nativeDivideInt x y
  modulo x y = nativeModuloInt x y

instance numberHasDivide :: HasDivide Number where
  divide x y = nativeDivideNumber x y
  modulo _ _ = 0.0

-- | Alias for `divide`.
-- |
-- | ``` purescript
-- | 5 / 2
-- | -- 2
-- | ```
(/) :: forall a. (HasDivide a) => a -> a -> a
(/) x y = divide x y
infixl 7 /

-- | Alias for `modulo`.
-- |
-- | ``` purescript
-- | 5 % 2
-- | -- 1
-- | ```
(%) :: forall a. (HasDivide a) => a -> a -> a
(%) x y = modulo x y
infixl 7 %

-- | Returns the multiplicative inverse.
-- |
-- | ``` purescript
-- | reciprocal 2
-- | -- 0.5
-- | ```
reciprocal :: forall a. (HasDivide a) => a -> a
reciprocal x = one / x
