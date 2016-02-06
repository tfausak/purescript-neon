module Neon.Class.Show where

import Neon.Class.Add as Add
import Neon.Class.FromArray as FromArray
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be converting to a string. This is typically
-- | used for debugging. The result of `show x` should be a valid PureScript
-- | expressions.
-- |
-- | ``` purescript
-- | show 123 -- "123"
-- | show (Just 123) -- "Just (123)"
-- | ```
class Show a where
  show :: a -> String

instance showArray :: (Show a) => Show (Array a) where
  show xs = Add.add (go (FromArray.fromArray xs)) "[" where
    go :: Data.List a -> String
    go l = case l of
      Data.Nil -> "]"
      Data.Cons h t -> Add.add
        (Add.add (go t) (case t of
          Data.Nil -> ""
          Data.Cons _ _ -> ", "))
        (show h)

instance showBoolean :: Show Boolean where
  show x = Prelude.show x

instance showChar :: Show Char where
  show x = Prelude.show x

instance showInt :: Show Int where
  show x = Prelude.show x

instance showList :: (Show a) => Show (Data.List a) where
  show xs = case xs of
    Data.Nil -> "Nil"
    Data.Cons h t -> Add.add ")" (Add.add (show t) (Add.add ") (" (Add.add (show h) "Cons (")))

instance showMaybe :: (Show a) => Show (Data.Maybe a) where
  show mx = case mx of
    Data.Nothing -> "Nothing"
    Data.Just x -> Add.add (Add.add ")" (show x)) "Just ("

instance showNumber :: Show Number where
  show x = Prelude.show x

instance showString :: Show String where
  show x = Prelude.show x

instance showUnit :: Show Data.Unit where
  show _ = "unit"
