module Neon.Types.Add
  ( Add
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
class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add x y = nativeAddArray x y

instance addBoolean :: Add Boolean where
  add x y = nativeAddBoolean x y

instance addFunction :: (Add b) => Add (a -> b) where
  add f g = \ x -> f x + g x

instance addInt :: Add Int where
  add x y = nativeAddInt x y

instance addNumber :: Add Number where
  add x y = nativeAddNumber x y

instance addString :: Add String where
  add x y = nativeAddString x y

-- | Alias for `add`.
(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add x y
infixl 6 +
