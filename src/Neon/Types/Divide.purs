module Neon.Types.Divide
  ( Divide
  , divide
  , modulo
  , (/)
  , (%)
  ) where

import Neon.Types.One (One)

foreign import nativeDivideInt :: Int -> Int -> Int
foreign import nativeModuloInt :: Int -> Int -> Int
foreign import nativeDivideNumber :: Number -> Number -> Number

-- | Laws:
-- | - Remainder: `(x / y) * y + (x % y) = x`
-- | - Identity: `x / one = x`
class (One a) <= Divide a where
  divide :: a -> a -> a
  modulo :: a -> a -> a

instance divideInt :: Divide Int where
  divide x y = nativeDivideInt x y
  modulo x y = nativeModuloInt x y

instance divideNumber :: Divide Number where
  divide x y = nativeDivideNumber x y
  modulo _ _ = 0.0

-- | Alias for `divide`.
(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide x y
infixl 7 /

-- | Alias for `modulo`.
(%) :: forall a. (Divide a) => a -> a -> a
(%) x y = modulo x y
infixl 7 %
