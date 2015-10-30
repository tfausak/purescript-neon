module Neon.And
  ( And
  , and
  , (&&)
  ) where

import Neon.Bounded (Bounded)

-- | Laws:
-- | - Associativity: `x && (y && z) = (x && y) && z`
-- | - Commutativity: `x && y = y && x`
-- | - Identity: `x && top = x`
-- | - Annihiliation: `x && bottom = bottom`
-- | - Idempotence: `x && x = x`
class (Bounded a) <= And a where
  and :: a -> a -> a

instance andBoolean :: And Boolean where
  and x y = if x then y else false

instance andFunction :: (And b) => And (a -> b) where
  and f g = \ x -> f x && g x

-- | Alias for `and`.
(&&) :: forall a. (And a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&
