module Neon.Types.HasMap
  ( HasMap
  , for
  , map
  , void
  , (<$)
  , (<$>)
  , ($>)
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasCompose ((>>))
import Neon.Values.Unit (Unit(), unit)

foreign import nativeMapArray :: forall a b. (a -> b) -> Array a -> Array b

-- | Represents types that can be mapped over. This is also know as a
-- | [functor](https://en.wikipedia.org/wiki/Functor).
-- |
-- | Laws:
-- | - Identity: `map identity = identity`
-- | - Composition: `map (f >> g) = map f >> map g`
class HasMap f where
  -- | Maps a function over a value.
  -- |
  -- | ``` purescript
  -- | map (+ 1) [1, 2, 3]
  -- | -- [2, 3, 4]
  -- | ```
  map :: forall a b. (a -> b) -> f a -> f b

instance arrayHasMap :: HasMap Array where
  map f x = nativeMapArray f x

instance functionHasMap :: HasMap (Function a) where
  map f g = g >> f

-- | Alias for `map`.
-- |
-- | ``` purescript
-- | (+ 1) <$> [1, 2, 3]
-- | -- [2, 3, 4]
-- | ```
(<$>) :: forall f a b. (HasMap f) => (a -> b) -> f a -> f b
(<$>) f x = map f x
infixl 4 <$>

-- | Replaces all values in the container with the given value.
-- |
-- | ``` purescript
-- | [1, 2, 3] $> true
-- | -- [true, true, true]
-- | ```
($>) :: forall f a b. (HasMap f) => f a -> b -> f b
($>) f x = always x <$> f
infixl 4 $>

-- | `($>)` with the arguments flipped.
-- |
-- | ``` purescript
-- | true <$ [1, 2, 3]
-- | -- [true, true, true]
-- | ```
(<$) :: forall f a b. (HasMap f) => a -> f b -> f a
(<$) x f = always x <$> f
infixl 4 <$

-- | Discards the result. This is useful for `Effect`s.
-- |
-- | ``` purescript
-- | void [1, 2, 3]
-- | -- [unit, unit, unit]
-- | ```
void :: forall f a. (HasMap f) => f a -> f Unit
void f = f $> unit

-- | `map` with the arguments flipped.
-- |
-- | ``` purescript
-- | for [1, 2, 3] (+ 1)
-- | -- [2, 3, 4]
-- | ```
for :: forall f a b. (HasMap f) => f a -> (a -> b) -> f b
for x f = map f x
