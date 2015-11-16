module Neon.Types.HasShow
  ( HasShow
  , show
  ) where

foreign import nativeShowArray :: forall a. (HasShow a) => (a -> String) -> Array a -> String
foreign import nativeShowChar :: Char -> String
foreign import nativeShowInt :: Int -> String
foreign import nativeShowNumber :: Number -> String
foreign import nativeShowString :: String -> String

-- | Represents types that can be converting to a string.
-- |
-- | This class does not have any laws.
class HasShow a where
  -- | Converts a value into a string.
  -- |
  -- | ``` purescript
  -- | show true
  -- | -- "true"
  -- | ```
  show :: a -> String

instance arrayHasShow :: (HasShow a) => HasShow (Array a) where
  show x = nativeShowArray show x

instance booleanHasShow :: HasShow Boolean where
  show x = if x then "true" else "false"

instance charHasShow :: HasShow Char where
  show x = nativeShowChar x

instance intHasShow :: HasShow Int where
  show x = nativeShowInt x

instance numberHasShow :: HasShow Number where
  show x = nativeShowNumber x

instance stringHasShow :: HasShow String where
  show x = nativeShowString x
