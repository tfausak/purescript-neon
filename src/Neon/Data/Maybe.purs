module Neon.Data.Maybe (Maybe(Nothing, Just), maybe) where

import Neon.Class.Add (add)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Show (Show, show)

data Maybe a
  = Nothing
  | Just a

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  equal x y = case { x: x, y: y } of
    { x: Nothing, y: Nothing } -> true
    { x: Just xj, y: Just yj } -> equal xj yj
    _ -> false

instance showMaybe :: (Show a) => Show (Maybe a) where
  show x = case x of
    Nothing -> "Nothing"
    Just j -> add "Just (" (add (show j) ")")

maybe :: forall a b. (a -> b) -> b -> Maybe a -> b
maybe f y x = case x of
  Nothing -> y
  Just j -> f j
