module Neon.Types.Or
  ( Or
  , or
  , (||)
  ) where

import Neon.Types.Bounded (Bounded)

-- | Laws:
-- | - Associativity: `x || (y || z) = (x || y) || z`
-- | - Commutativity: `x || y = y || x`
-- | - Identity: `x || bottom = x`
-- | - Annihiliation: `x || top = top`
-- | - Idempotence: `x || x = x`
class (Bounded a) <= Or a where
  or :: a -> a -> a

instance orBoolean :: Or Boolean where
  or x y = if x then true else y

instance orFunction :: (Or b) => Or (a -> b) where
  or f g = \ x -> f x || g x

-- | Alias for `or`.
(||) :: forall a. (Or a) => a -> a -> a
(||) x y = or x y
infixr 2 ||
