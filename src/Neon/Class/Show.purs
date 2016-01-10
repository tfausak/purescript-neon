module Neon.Class.Show (Show, show) where

import Neon.Class.Add (add)
import Neon.Data (Maybe(Nothing, Just))
import Prelude as Prelude

class Show a where
  show :: a -> String

-- TODO: instance showArray :: (Show a) => Show (Array a) where

instance showBoolean :: Show Boolean where
  show x = Prelude.show x

instance showChar :: Show Char where
  show x = Prelude.show x

instance showInt :: Show Int where
  show x = Prelude.show x

-- TODO: instance showList :: (Show a) => Show (List a) where

instance showMaybe :: (Show a) => Show (Maybe a) where
  show mx = case mx of
    Nothing -> "Nothing"
    Just x -> add (add ")" (show x)) "Just ("

instance showNumber :: Show Number where
  show x = Prelude.show x

instance showString :: Show String where
  show x = Prelude.show x
