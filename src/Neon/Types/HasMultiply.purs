module Neon.Types.HasMultiply
  ( HasMultiply
  , multiply
  , (*)
  ) where

import Neon.Types.HasZero (HasZero)

foreign import nativeMultiplyBoolean :: Boolean -> Boolean -> Boolean
foreign import nativeMultiplyInt :: Int -> Int -> Int
foreign import nativeMultiplyNumber :: Number -> Number -> Number

-- | Represents values that can be multiplied together. This is also known as
-- | a [near-ring](https://en.wikipedia.org/wiki/Near-ring).
-- |
-- | Laws:
-- | - Associativity: `x * (y * z) = (x * y) * z`
-- | - Distributivity: `x * (y + z) = (x * y) + (x * z)`
-- | - Annihilation: `x * zero = zero * x = zero`
class (HasZero a) <= HasMultiply a where
  -- | Multiplies two values together.
  -- |
  -- | ``` purescript
  -- | multiply 3 2
  -- | -- 6
  -- | ```
  multiply :: a -> a -> a

instance booleanHasMultiply :: HasMultiply Boolean where
  multiply x y = if x then y else false

instance functionHasMultiply :: (HasMultiply b) => HasMultiply (a -> b) where
  multiply f g = \ x -> f x * g x

instance intHasMultiply :: HasMultiply Int where
  multiply x y = nativeMultiplyInt x y

instance numberHasMultiply :: HasMultiply Number where
  multiply x y = nativeMultiplyNumber x y

-- | Alias for `multiply`.
-- |
-- | ``` purescript
-- | 3 * 2
-- | -- 6
-- | ```
(*) :: forall a. (HasMultiply a) => a -> a -> a
(*) = multiply
infixl 7 *
