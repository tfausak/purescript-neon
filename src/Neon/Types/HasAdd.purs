module Neon.Types.HasAdd
  ( HasAdd
  , add
  , (+)
  ) where

foreign import nativeAddArray :: forall a. Array a -> Array a -> Array a
foreign import nativeAddBoolean :: Boolean -> Boolean -> Boolean
foreign import nativeAddInt :: Int -> Int -> Int
foreign import nativeAddNumber :: Number -> Number -> Number
foreign import nativeAddString :: String -> String -> String

-- | Represents types that can be added together. This is also known as a
-- | [semigroup](https://en.wikipedia.org/wiki/Semigroup).
-- |
-- | Laws:
-- | - Associativity: `x + (y + z) = (x + y) + z`
class HasAdd a where
  -- | Adds two values together.
  -- |
  -- | ``` purescript
  -- | add "a" "b"
  -- | -- "ab"
  -- | ```
  add :: a -> a -> a

instance arrayHasAdd :: HasAdd (Array a) where
  add x y = nativeAddArray x y

instance booleanHasAdd :: HasAdd Boolean where
  add x y = if x then true else y

instance functionHasAdd :: (HasAdd b) => HasAdd (a -> b) where
  add f g = \ x -> f x + g x

instance intHasAdd :: HasAdd Int where
  add x y = nativeAddInt x y

instance numberHasAdd :: HasAdd Number where
  add x y = nativeAddNumber x y

instance stringHasAdd :: HasAdd String where
  add x y = nativeAddString x y

-- | Alias for `add`.
-- |
-- | ``` purescript
-- | "a" + "b"
-- | -- "ab"
-- | ```
(+) :: forall a. (HasAdd a) => a -> a -> a
(+) = add
infixl 6 +
