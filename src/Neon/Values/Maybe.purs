module Neon.Values.Maybe
  ( Maybe(Nothing, Just)
  , isJust
  , isNothing
  , maybe
  , withDefault
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasAdd (HasAdd, add, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, and)
import Neon.Types.HasApply (HasApply, (<*>))
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasDivide (HasDivide, divide, modulo)
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasIdentity (identity)
import Neon.Types.HasMap (HasMap, map)
import Neon.Types.HasMultiply (HasMultiply, multiply)
import Neon.Types.HasNot (HasNot, not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasOr (HasOr, or)
import Neon.Types.HasPure (HasPure)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasSubtract (HasSubtract, subtract)
import Neon.Types.HasTop (HasTop, top)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))

-- | Represents an optional value. This is similar to `null` in other
-- | languages, where `Nothing` is `null` and `Just x` is `x`.
data Maybe a
  = Nothing
  | Just a

instance maybeHasAdd :: (HasAdd a) => HasAdd (Maybe a) where
  add x y = map add x <*> y

instance maybeHasAlternative :: HasAlternative Maybe where
  alternative Nothing y = y
  alternative x _ = x

instance maybeHasAnd :: (HasAnd a) => HasAnd (Maybe a) where
  and x y = map and x <*> y

instance maybeHasApply :: HasApply Maybe where
  apply (Just f) x = map f x
  apply _ _ = Nothing

instance maybeHasBind :: HasBind Maybe where
  bind Nothing _ = Nothing
  bind (Just x) f = f x

instance maybeHasBottom :: (HasBottom a) => HasBottom (Maybe a) where
  bottom = Nothing

instance maybeHasCompare :: (HasCompare a) => HasCompare (Maybe a) where
  compare (Just x) (Just y) = compare x y
  compare Nothing Nothing = EqualTo
  compare Nothing _ = LessThan
  compare _ Nothing = GreaterThan

instance maybeHasDivide :: (HasDivide a) => HasDivide (Maybe a) where
  divide x y = map divide x <*> y
  modulo x y = map modulo x <*> y

instance maybeHasEmpty :: HasEmpty Maybe where
  empty = Nothing

instance maybeHasEqual :: (HasEqual a) => HasEqual (Maybe a) where
  equal Nothing Nothing = true
  equal (Just x) (Just y) = x == y
  equal _ _ = false

instance maybeHasFold :: HasFold Maybe where
  foldl f y x = case x of
    Just j -> f y j
    Nothing -> y
  foldr f y x = case x of
    Just j -> f j y
    Nothing -> y

instance maybeHasMap :: HasMap Maybe where
  map _ Nothing = Nothing
  map f (Just x) = Just (f x)

instance maybeHasMultiply :: (HasMultiply a) => HasMultiply (Maybe a) where
  multiply x y = map multiply x <*> y

instance maybeHasNot :: (HasNot a) => HasNot (Maybe a) where
  not x = map not x

instance maybeHasOne :: (HasOne a) => HasOne (Maybe a) where
  one = Just one

instance maybeHasOr :: (HasOr a) => HasOr (Maybe a) where
  or x y = map or x <*> y

instance maybeHasPure :: HasPure Maybe where
  pure x = Just x

instance maybeHasShow :: (HasShow a) => HasShow (Maybe a) where
  show Nothing = "Nothing"
  show (Just x) = "Just (" + show x + ")"

instance maybeHasSubtract :: (HasSubtract a) => HasSubtract (Maybe a) where
  subtract x y = map subtract x <*> y

instance maybeHasTop :: (HasTop a) => HasTop (Maybe a) where
  top = Just top

instance maybeHasZero :: (HasZero a) => HasZero (Maybe a) where
  zero = Just zero

-- | Returns the default value if the `Maybe` is `Nothing`. If instead the
-- | `Maybe` is `Just x`, call the function with `x`.
-- |
-- | ``` purescript
-- | maybe 0 (+ 1) Nothing
-- | -- 0
-- | maybe 0 (+ 1) (Just 2)
-- | -- 3
-- | ```
maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
maybe y f m = case m of
  Just x -> f x
  Nothing -> y

-- | Returns `true` if the `Maybe` is `Just x`. Returns `false` otherwise.
-- |
-- | ``` purescript
-- | isJust (Just 1)
-- | -- true
-- | isJust Nothing
-- | -- false
-- | ```
isJust :: forall a. Maybe a -> Boolean
isJust m = maybe false (always true) m

-- | Returns `true` if the `Maybe` is `Nothing`. Returns `false` otherwise.
-- |
-- | ``` purescript
-- | isNothing Nothing
-- | -- true
-- | isNothing (Just 1)
-- | -- false
-- | ```
isNothing :: forall a. Maybe a -> Boolean
isNothing m = not (isJust m)

-- | Returns the default value if the `Maybe` is `Nothing`. If instead the
-- | `Maybe` is `Just x`, return `x`.
-- |
-- | ``` purescript
-- | withDefault 0 Nothing
-- | -- 0
-- | withDefault 0 (Just 2)
-- | -- 2
-- | ```
withDefault :: forall a. a -> Maybe a -> a
withDefault y m = maybe y identity m
