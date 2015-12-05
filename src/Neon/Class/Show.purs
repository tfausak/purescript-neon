module Neon.Class.Show (Show, show) where

foreign import nativeShow :: forall a. a -> String
foreign import nativeShowString :: String -> String

class Show a where
  show :: a -> String

instance showBoolean :: Show Boolean where
  show = nativeShow

instance showString :: Show String where
  show = nativeShowString
