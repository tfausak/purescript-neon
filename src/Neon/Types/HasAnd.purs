module Neon.Types.HasAnd
  ( HasAnd
  , and
  , (&&)
  ) where

import Neon.Types.IsBounded (IsBounded)

-- | Laws:
-- | - Associativity: `x && (y && z) = (x && y) && z`
-- | - Commutativity: `x && y = y && x`
-- | - HasIdentity: `x && top = x`
-- | - Annihiliation: `x && bottom = bottom`
-- | - Idempotence: `x && x = x`
class (IsBounded a) <= HasAnd a where
  and :: a -> a -> a

instance booleanHasAnd :: HasAnd Boolean where
  and x y = if x then y else false

instance functionHasAnd :: (HasAnd b) => HasAnd (a -> b) where
  and f g = \ x -> f x && g x

-- | Alias for `and`.
(&&) :: forall a. (HasAnd a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&
