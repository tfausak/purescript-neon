module Neon.Divide
  ( Divide
  , divide
  , modulo
  , (/)
  , (%)
  ) where

import Neon.One (One)

foreign import jsDivideInt :: Int -> Int -> Int
foreign import jsModuloInt :: Int -> Int -> Int
foreign import jsDivideNumber :: Number -> Number -> Number

-- | Laws:
-- | - Remainder: `(x / y) * y + (x % y) = x`
-- | - Identity: `x / one = x`
class (One a) <= Divide a where
  divide :: a -> a -> a
  modulo :: a -> a -> a

instance divideInt :: Divide Int where
  divide x y = jsDivideInt x y
  modulo x y = jsModuloInt x y

instance divideNumber :: Divide Number where
  divide x y = jsDivideNumber x y
  modulo _ _ = 0.0

-- | Alias for `divide`.
(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide x y
infixl 7 /

-- | Alias for `modulo`.
(%) :: forall a. (Divide a) => a -> a -> a
(%) x y = modulo x y
infixl 7 %
