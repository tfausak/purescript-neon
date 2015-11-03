module Neon.Types.HasPure
  ( HasPure
  , pure
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.HasApply (HasApply)

-- | Laws:
-- | - HasIdentity: `(pure id) <*> v = v`
-- | - Composition: `(pure <<) <*> f <*> g <*> h = f <*> (g <*> h)`
-- | - Homomorphism: `(pure f) <*> (pure x) = pure (f x)`
-- | - Interchange: `u <*> (pure y) = (pure (\ f -> f y)) <*> u`
class (HasApply f) <= HasPure f where
  pure :: forall a. a -> f a

instance arrayHasPure :: HasPure Array where
  pure x = [x]

instance functionHasPure :: HasPure (Function a) where
  pure x = constant x
