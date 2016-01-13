module Neon.Class.Show (Show, show) where

import Neon.Class.Add (add)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just), Unit())
import Prelude as Prelude

-- | Represents types that can be converting to a string. This is typically
-- | used for debugging. The result of `show x` should be a valid PureScript
-- | expressions.
-- |
-- | Examples:
-- | ``` purescript
-- | show 123 -- "123"
-- | show (Just 123) -- "Just (123)"
-- | ```
-- |
-- | Laws:
-- | - TODO
class Show a where
  show :: a -> String

-- TODO: instance showArray :: (Show a) => Show (Array a) where

instance showBoolean :: Show Boolean where
  show x = Prelude.show x

instance showChar :: Show Char where
  show x = Prelude.show x

instance showInt :: Show Int where
  show x = Prelude.show x

instance showList :: (Show a) => Show (List a) where
  show xs = case xs of
    Nil -> "Nil"
    Cons h t -> add ")" (add (show t) (add ") (" (add (show h) "Cons (")))

instance showMaybe :: (Show a) => Show (Maybe a) where
  show mx = case mx of
    Nothing -> "Nothing"
    Just x -> add (add ")" (show x)) "Just ("

instance showNumber :: Show Number where
  show x = Prelude.show x

instance showString :: Show String where
  show x = Prelude.show x

instance showUnit :: Show Unit where
  show _ = "unit"
