module Neon.Values.Text
  ( Text()
  , fromText
  , toText
  ) where

import Neon.Types.Add (Add, (+))
import Neon.Types.Equal (Equal, (==))
import Neon.Types.Map (Map)
import Neon.Types.Show (Show, show)

foreign import nativeCoerce :: forall a b. a -> b
foreign import nativeMap :: forall a b. (a -> b) -> Text a -> Text b

newtype Text a = Text String

-- TODO: Add more instances.

instance addText :: Add (Text a) where
  add x y = fromString (toString x + toString y)

instance equalText :: (Equal a) => Equal (Text a) where
  equal x y = toString x == toString y

instance mapText :: Map Text where
  map f x = nativeMap f x

instance showText :: (Show a) => Show (Text a) where
  show x = show (toString x)

fromText :: Text Char -> String
fromText x = nativeCoerce x

toText :: String -> Text Char
toText x = nativeCoerce x

-- NOTE: These functions are unsafe and should not be exported.

fromString :: forall a. String -> Text a
fromString x = nativeCoerce x

toString :: forall a. Text a -> String
toString x = nativeCoerce x
