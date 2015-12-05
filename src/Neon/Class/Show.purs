module Neon.Class.Show (Show, show) where

foreign import nativeShowString :: String -> String

class Show a where
  show :: a -> String

instance showBoolean :: Show Boolean where
  show x = case x of
    false -> "false"
    true -> "true"

instance showString :: Show String where
  show = nativeShowString
