module Ax.Add
  ( Add
  , add
  , (+)
  ) where

foreign import jsAddArray :: forall a. Array a -> Array a -> Array a
foreign import jsAddInt :: Int -> Int -> Int
foreign import jsAddNumber :: Number -> Number -> Number
foreign import jsAddString :: String -> String -> String

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add x y = jsAddArray x y

instance addInt :: Add Int where
  add x y = jsAddInt x y

instance addNumber :: Add Number where
  add x y = jsAddNumber x y

instance addString :: Add String where
  add x y = jsAddString x y

(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add x y
infixl 6 +
