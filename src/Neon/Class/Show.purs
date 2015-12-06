module Neon.Class.Show (Show, show) where

foreign import nativeShow :: forall a. a -> String
foreign import nativeShowArray :: forall a. (Show a) => Array a -> String
foreign import nativeShowChar :: Char -> String
foreign import nativeShowNumber :: Number -> String
foreign import nativeShowString :: String -> String

class Show a where
  show :: a -> String

instance showArray :: (Show a) => Show (Array a) where
  show = nativeShowArray

instance showBoolean :: Show Boolean where
  show = nativeShow

instance showChar :: Show Char where
  show = nativeShowChar

instance showInt :: Show Int where
  show = nativeShow

instance showNumber :: Show Number where
  show = nativeShowNumber

instance showString :: Show String where
  show = nativeShowString
