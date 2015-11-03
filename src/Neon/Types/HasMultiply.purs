module Neon.Types.HasMultiply
  ( HasMultiply
  , multiply
  , (*)
  ) where

import Neon.Types.HasZero (HasZero)

foreign import nativeMultiplyBoolean :: Boolean -> Boolean -> Boolean
foreign import nativeMultiplyInt :: Int -> Int -> Int
foreign import nativeMultiplyNumber :: Number -> Number -> Number

-- | Laws:
-- | - Associativity: `x * (y * z) = (x * y) * z`
-- | - Distributivity: `x * (y + z) = (x * y) + (x * z)`
-- | - Annihilation: `x * zero = zero * x = zero`
class (HasZero a) <= HasMultiply a where
  multiply :: a -> a -> a

instance booleanHasMultiply :: HasMultiply Boolean where
  multiply x y = nativeMultiplyBoolean x y

instance functionHasMultiply :: (HasMultiply b) => HasMultiply (a -> b) where
  multiply f g = \ x -> f x * g x

instance intHasMultiply :: HasMultiply Int where
  multiply x y = nativeMultiplyInt x y

instance numberHasMultiply :: HasMultiply Number where
  multiply x y = nativeMultiplyNumber x y

-- | Alias for `multiply`.
(*) :: forall a. (HasMultiply a) => a -> a -> a
(*) x y = multiply x y
infixl 7 *
