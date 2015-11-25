module Neon.Types.HasCompose
  ( HasCompose
  , compose
  , (<<)
  , (>>)
  ) where

import Neon.Primitives.Function (flip)

-- | Represents types that have a composition morphism.
-- |
-- | Laws:
-- | - Associativity: `f >> (g >> h) = (f >> g) >> h`
class HasCompose f where
  -- | The composition morphism. This is most commonly used as function
  -- | composition.
  -- |
  -- | ``` purescript
  -- | (compose (+ 2) (* 2)) 3
  -- | -- 10
  -- | ```
  compose :: forall a b c. f a b -> f b c -> f a c

instance functionHasCompose :: HasCompose Function where
  compose f g = \ x -> g (f x)

-- | Alias for `compose`.
-- |
-- | ``` purescript
-- | ((+ 2) >> (* 2)) 3
-- | -- 10
-- | ```
(>>) :: forall f a b c. (HasCompose f) => f a b -> f b c -> f a c
(>>) = compose
infixr 9 >>

-- | `(>>)` with the arguments flipped.
-- |
-- | ``` purescript
-- | ((* 2) << (+ 2)) 3
-- | -- 10
-- | ```
(<<) :: forall f a b c. (HasCompose f) => f b c -> f a b -> f a c
(<<) = flip compose
infixr 9 <<
