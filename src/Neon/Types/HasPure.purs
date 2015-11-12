module Neon.Types.HasPure
  ( HasPure
  , pure
  , when
  , unless
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasNot (not)
import Neon.Values.Unit (Unit(), unit)

-- | Laws:
-- | - Identity: `(pure id) <*> v = v`
-- | - Composition: `(pure <<) <*> f <*> g <*> h = f <*> (g <*> h)`
-- | - Homomorphism: `(pure f) <*> (pure x) = pure (f x)`
-- | - Interchange: `u <*> (pure y) = (pure (\ f -> f y)) <*> u`
class (HasApply f) <= HasPure f where
  pure :: forall a. a -> f a

instance arrayHasPure :: HasPure Array where
  pure x = [x]

instance functionHasPure :: HasPure (Function a) where
  pure x = constant x

when :: forall f. (HasPure f) => Boolean -> f Unit -> f Unit
when p x = if p then x else pure unit

unless :: forall f. (HasPure f) => Boolean -> f Unit -> f Unit
unless p x = when (not p) x
