module Neon.Types.Show
  ( Show
  , show
  ) where

foreign import nativeShowArray :: forall a. (Show a) => (a -> String) -> Array a -> String
foreign import nativeShowChar :: Char -> String
foreign import nativeShowInt :: Int -> String
foreign import nativeShowNumber :: Number -> String
foreign import nativeShowString :: String -> String

-- This class is lawless. It could have laws if there was a corresponding
-- `Read` class, but there isn't.
class Show a where
  show :: a -> String

instance showArray :: (Show a) => Show (Array a) where
  show x = nativeShowArray show x

instance showBoolean :: Show Boolean where
  show x = if x then "true" else "false"

instance showChar :: Show Char where
  show x = nativeShowChar x

instance showInt :: Show Int where
  show x = nativeShowInt x

instance showNumber :: Show Number where
  show x = nativeShowNumber x

instance showString :: Show String where
  show x = nativeShowString x
