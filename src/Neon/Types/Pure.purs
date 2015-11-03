module Neon.Types.Pure
  ( Pure
  , pure
  ) where

import Neon.Primitives.Function (constant)
import Neon.Types.Apply (Apply)

-- | Laws:
-- | - Identity: `(pure id) <*> v = v`
-- | - Composition: `(pure <<) <*> f <*> g <*> h = f <*> (g <*> h)`
-- | - Homomorphism: `(pure f) <*> (pure x) = pure (f x)`
-- | - Interchange: `u <*> (pure y) = (pure (\ f -> f y)) <*> u`
class (Apply f) <= Pure f where
  pure :: forall a. a -> f a

instance pureArray :: Pure Array where
  pure x = [x]

instance pureFunction :: Pure (Function a) where
  pure x = constant x
