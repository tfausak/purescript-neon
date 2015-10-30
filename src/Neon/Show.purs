module Neon.Show
  ( Show
  , show
  ) where

foreign import jsShowArray :: forall a. (Show a) => (a -> String) -> Array a -> String
foreign import jsShowChar :: Char -> String
foreign import jsShowInt :: Int -> String
foreign import jsShowNumber :: Number -> String
foreign import jsShowString :: String -> String

class Show a where
  show :: a -> String

instance showArray :: (Show a) => Show (Array a) where
  show x = jsShowArray show x

instance showBoolean :: Show Boolean where
  show x = if x then "true" else "false"

instance showChar :: Show Char where
  show x = jsShowChar x

instance showInt :: Show Int where
  show x = jsShowInt x

instance showNumber :: Show Number where
  show x = jsShowNumber x

instance showString :: Show String where
  show x = jsShowString x
