module Neon.Class.Show (Show, show) where

import Prelude as Prelude

class Show a where
  show :: a -> String

-- TODO
-- instance showArray :: (Show a) => Show (Array a) where
--   show = nativeShowArray

instance showBoolean :: Show Boolean where
  show x = Prelude.show x

instance showChar :: Show Char where
  show x = Prelude.show x

instance showInt :: Show Int where
  show x = Prelude.show x

instance showNumber :: Show Number where
  show x = Prelude.show x

instance showString :: Show String where
  show x = Prelude.show x