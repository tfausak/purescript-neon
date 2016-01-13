module Neon.Class.Show (class Show, show) where

import Neon.Class.Add (add)
import Neon.Class.FromArray (fromArray)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just), Unit())
import Prelude (..) as Prelude

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
  show xs = add (go (fromArray xs)) "[" where
    go :: List a -> String
    go l = case l of
      Nil -> "]"
      Cons h t -> add
        (add (go t) (case t of
          Nil -> ""
          Cons _ _ -> ", "))
        (show h)

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
