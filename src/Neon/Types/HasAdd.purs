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

-- | Laws:
-- | - Associativity: `x + (y + z) = (x + y) + z`
class HasAdd a where
  add :: a -> a -> a

instance addArray :: HasAdd (Array a) where
  add x y = nativeAddArray x y

instance addBoolean :: HasAdd Boolean where
  add x y = nativeAddBoolean x y

instance addFunction :: (HasAdd b) => HasAdd (a -> b) where
  add f g = \ x -> f x + g x

instance addInt :: HasAdd Int where
  add x y = nativeAddInt x y

instance addNumber :: HasAdd Number where
  add x y = nativeAddNumber x y

instance addString :: HasAdd String where
  add x y = nativeAddString x y

-- | Alias for `add`.
(+) :: forall a. (HasAdd a) => a -> a -> a
(+) x y = add x y
infixl 6 +
