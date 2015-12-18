module Neon.Data.Maybe (Maybe(Nothing, Just), maybe) where

import Neon.Class.Add (add)
import Neon.Class.Apply (class Apply)
import Neon.Class.Bind (class Bind)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.FromArray (class FromArray)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Less (class Less, less)
import Neon.Class.Map (class Map)
import Neon.Class.Pure (class Pure)
import Neon.Class.Reduce (reduce)
import Neon.Class.Show (class Show, show)
import Neon.Class.ToArray (class ToArray)

data Maybe a
  = Nothing
  | Just a

instance applyMaybe :: Apply Maybe where
  apply mf mx = case { mf: mf, mx: mx } of
    { mf: Just f, mx: Just x } -> Just (f x)
    _ -> Nothing

instance bindMaybe :: Bind Maybe where
  bind mx f = case mx of
    Nothing -> Nothing
    Just x -> f x

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  equal x y = case { x: x, y: y } of
    { x: Nothing, y: Nothing } -> true
    { x: Just xj, y: Just yj } -> equal xj yj
    _ -> false

instance fromArrayMaybe :: FromArray a (Maybe a) where
  fromArray x = reduce (\ a e -> case a of
    Nothing -> Just e
    Just _ -> a) Nothing x

instance greaterMaybe :: (Greater a) => Greater (Maybe a) where
  greater mx my = case { x: mx, y: my } of
    { x: Just x, y: Just y } -> greater x y
    { x: Just _, y: Nothing } -> true
    _ -> false

instance lessMaybe :: (Less a) => Less (Maybe a) where
  less mx my = case { x: mx, y: my } of
    { x: Just x, y: Just y } -> less x y
    { x: Nothing, y: Just _ } -> true
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

instance toArrayMaybe :: ToArray (Maybe a) a where
  toArray m = case m of
    Nothing -> []
    Just x -> [x]

maybe :: forall a b. (a -> b) -> b -> Maybe a -> b
maybe f y x = case x of
  Nothing -> y
  Just j -> f j
