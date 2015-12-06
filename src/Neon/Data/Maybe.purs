module Neon.Data.Maybe (Maybe(Nothing, Just), maybe) where

import Neon.Class.Add (add)
import Neon.Class.Apply (Apply)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Map (Map)
import Neon.Class.Pure (Pure)
import Neon.Class.Show (Show, show)

data Maybe a
  = Nothing
  | Just a

instance applyMaybe :: Apply Maybe where
  apply mf mx = case { mf: mf, mx: mx } of
    { mf: Just f, mx: Just x } -> Just (f x)
    _ -> Nothing

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  equal x y = case { x: x, y: y } of
    { x: Nothing, y: Nothing } -> true
    { x: Just xj, y: Just yj } -> equal xj yj
    _ -> false

instance mapMaybe :: Map Maybe where
  map f mx = case mx of
    Nothing -> Nothing
    Just x -> Just (f x)

instance pureMaybe :: Pure Maybe where
  pure = Just

instance showMaybe :: (Show a) => Show (Maybe a) where
  show x = case x of
    Nothing -> "Nothing"
    Just j -> add "Just (" (add (show j) ")")

maybe :: forall a b. (a -> b) -> b -> Maybe a -> b
maybe f y x = case x of
  Nothing -> y
  Just j -> f j
