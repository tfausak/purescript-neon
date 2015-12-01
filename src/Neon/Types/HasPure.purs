module Neon.Types.HasPure
  ( HasPure
  , pure
  , unless
  , when
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasNot (not)
import Neon.Values.Unit (Unit(), unit)

-- | Represents types that allow injecting values into a container.
-- |
-- | Laws:
-- | - Identity: `apply (pure id) v = v`
-- | - Composition: `apply (apply (apply (pure <<) f) g) h = apply f (apply g h)`
-- | - Homomorphism: `apply (pure f) (pure x) = pure (f x)`
-- | - Interchange: `apply u (pure y) = apply (pure \ f -> f y) u`
class (HasApply f) <= HasPure f where
  -- | Injects a value into a container.
  -- |
  -- | ``` purescript
  -- | pure unit
  -- | -- Just unit
  -- | pure unit
  -- | -- [unit]
  -- | ```
  pure :: forall a. a -> f a

instance arrayHasPure :: HasPure Array where
  pure x = [x]

instance functionHasPure :: HasPure (Function a) where
  pure x = always x

-- | If the condition is `true`, returns the value. Otherwise returns
-- | `pure unit`.
-- |
-- | ``` purescript
-- | when false [unit, unit]
-- | -- [unit]
-- | when true [unit, unit]
-- | -- [unit, unit]
-- | ```
when :: forall f. (HasPure f) => Boolean -> f Unit -> f Unit
when p x = if p then x else pure unit

-- | If the condition is `false`, returns the value. Otherwise returns
-- | `pure unit`.
-- |
-- | ``` purescript
-- | unless true [unit, unit]
-- | -- [unit]
-- | unless false [unit, unit]
-- | -- [unit, unit]
-- | ```
unless :: forall f. (HasPure f) => Boolean -> f Unit -> f Unit
unless p x = when (not p) x
