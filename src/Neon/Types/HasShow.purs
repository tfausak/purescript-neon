module Neon.Types.HasShow
  ( HasShow
  , show
  ) where

foreign import nativeShowArray :: forall a. (HasShow a) => (a -> String) -> Array a -> String
foreign import nativeShowChar :: Char -> String
foreign import nativeShowInt :: Int -> String
foreign import nativeShowNumber :: Number -> String
foreign import nativeShowString :: String -> String

-- This class is lawless. It could have laws if there was a corresponding
-- `Read` class, but there isn't.
class HasShow a where
  show :: a -> String

instance showArray :: (HasShow a) => HasShow (Array a) where
  show x = nativeShowArray show x

instance showBoolean :: HasShow Boolean where
  show x = if x then "true" else "false"

instance showChar :: HasShow Char where
  show x = nativeShowChar x

instance showInt :: HasShow Int where
  show x = nativeShowInt x

instance showNumber :: HasShow Number where
  show x = nativeShowNumber x

instance showString :: HasShow String where
  show x = nativeShowString x
