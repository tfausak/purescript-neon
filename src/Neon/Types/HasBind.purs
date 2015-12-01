module Neon.Types.HasBind
  ( HasBind
  , bind
  , join
  ) where

import Neon.Types.HasIdentity (identity)
import Neon.Types.HasFold (sum)
import Neon.Types.HasMap (map)
import Neon.Types.HasPure (HasPure)

-- | Represents types that can express sequential actions. This is also known
-- | as a [monad](https://en.wikipedia.org/wiki/Monad_(functional_programming)).
-- |
-- | Laws:
-- | - Associativity: `bind (bind x f) g = bind x (\ k -> bind (f k) g)`
class (HasPure f) <= HasBind f where
  -- | Sequentially execute an action.
  -- |
  -- | ``` purescript
  -- | bind (\ x -> [x, x]) [1, 2]
  -- | -- [1, 1, 2, 2]
  -- | ```
  bind :: forall a b. f a -> (a -> f b) -> f b

instance arrayHasBind :: HasBind Array where
  bind xs f = sum (map f xs)

instance functionHasbind :: HasBind (Function a) where
  bind g f = \ x -> f (g x) x

-- | Collapses two wrappers into one.
-- |
-- | ``` purescript
-- | join [[1, 2], [3, 4]]
-- | -- [1, 2, 3, 4]
-- | ```
join :: forall f a. (HasBind f) => f (f a) -> f a
join x = bind x identity
