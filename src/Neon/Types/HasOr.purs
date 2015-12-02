module Neon.Types.HasOr
  ( HasOr
  , or
  , (||)
  ) where

import Neon.Types.HasAdd ((+))
import Neon.Types.HasBottom (HasBottom)
import Neon.Types.HasTop (HasTop)

-- | Represents types than can be "or"ed together. This is also known as a
-- | [logical disjunction](https://en.wikipedia.org/wiki/Logical_disjunction).
-- |
-- | Laws:
-- | - Associativity: `x || (y || z) = (x || y) || z`
-- | - Commutativity: `x || y = y || x`
-- | - Identity: `x || bottom = x`
-- | - Annihiliation: `x || top = top`
-- | - Idempotence: `x || x = x`
class (HasBottom a, HasTop a) <= HasOr a where
  -- | "Or"s two values together.
  -- |
  -- | ``` purescript
  -- | or false true
  -- | -- true
  -- | ```
  or :: a -> a -> a

instance booleanHasOr :: HasOr Boolean where
  or x y = x + y

instance functionHasOr :: (HasOr b) => HasOr (a -> b) where
  or f g = \ x -> f x || g x

-- | Alias for `or`.
-- |
-- | ``` purescript
-- | false || true
-- | -- true
-- | ```
(||) :: forall a. (HasOr a) => a -> a -> a
(||) = or
infixr 2 ||
