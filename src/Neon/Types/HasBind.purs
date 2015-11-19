module Neon.Types.HasBind
  ( HasBind
  , bind
  , join
  , (<=<)
  , (=<<)
  , (>=>)
  , (>>=)
  ) where

import Neon.Types.HasIdentity (identity)
import Neon.Types.HasFold (sum)
import Neon.Types.HasMap (map)
import Neon.Types.HasPure (HasPure)

-- | Represents types that can express sequential actions. This is also known
-- | as a [monad](https://en.wikipedia.org/wiki/Monad_(functional_programming)).
-- |
-- | Laws:
-- | - Associativity: `(x >>= f) >>= g = x >>= (\ k => f k >>= g)`
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

-- | Alias for `bind`.
-- |
-- | ``` purescript
-- | [1, 2] >>= \ x -> [x, x]
-- | -- [1, 1, 2, 2]
-- | ```
(>>=) :: forall f a b. (HasBind f) => f a -> (a -> f b) -> f b
(>>=) x f = bind x f
infixl 1 >>=

-- | `(>>=)` with the arguments reversed.
-- |
-- | ``` purescript
-- | (\ x -> [x, x]) =<< [1, 2]
-- | -- [1, 1, 2, 2]
-- | ```
(=<<) :: forall f a b. (HasBind f) => (a -> f b) -> f a -> f b
(=<<) f x = bind x f
infixr 1 =<<

-- | Composes actions together from left to right.
-- |
-- | ``` purescript
-- | ((\ x -> [x, x]) >=> (\ x -> [x - 1, x + 1])) 2
-- | -- [1, 3, 1, 3]
-- | ```
(>=>) :: forall f a b c. (HasBind f) => (a -> f b) -> (b -> f c) -> (a -> f c)
(>=>) f g = \ x -> f x >>= g
infixl 1 >=>

-- | `(>=>)` with the arguments reversed.
-- |
-- | ``` purescript
-- | ((\ x -> [x, x]) <=< (\ x -> [x - 1, x + 1])) 2
-- | -- [1,1,3,3]
-- | ```
(<=<) :: forall f a b c. (HasBind f) => (b -> f c) -> (a -> f b) -> (a -> f c)
(<=<) f g = \ x -> f =<< g x
infixr 1 <=<

-- | Collapses two wrappers into one.
-- |
-- | ``` purescript
-- | join [[1, 2], [3, 4]]
-- | -- [1, 2, 3, 4]
-- | ```
join :: forall f a. (HasBind f) => f (f a) -> f a
join x = x >>= identity
