module Neon.Class.Show (class Show, show) where

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

instance showFunction :: Show (a -> b) where
  show _ = "{- Function -}"

instance showInt :: Show Int where
  show = nativeShow

instance showNumber :: Show Number where
  show = nativeShowNumber

instance showObject :: Show { | a } where
  show _ = "{- Object -}"

instance showString :: Show String where
  show = nativeShowString
