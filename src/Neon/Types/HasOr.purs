module Neon.Types.HasOr
  ( HasOr
  , or
  , (||)
  ) where

import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasTop (HasTop)

-- | Laws:
-- | - Associativity: `x || (y || z) = (x || y) || z`
-- | - Commutativity: `x || y = y || x`
-- | - Identity: `x || bottom = x`
-- | - Annihiliation: `x || top = top`
-- | - Idempotence: `x || x = x`
class (HasBottom a, HasTop a) <= HasOr a where
  or :: a -> a -> a

instance booleanHasOr :: HasOr Boolean where
  or x y = if x then true else y

-- | Alias for `or`.
(||) :: forall a. (HasOr a) => a -> a -> a
(||) x y = or x y
infixr 2 ||
