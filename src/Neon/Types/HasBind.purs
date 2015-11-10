module Neon.Types.HasBind
  ( HasBind
  , bind
  , join
  , (<=<)
  , (=<<)
  , (>=>)
  , (>>=)
  ) where

import Neon.Types.HasApply (apply)
import Neon.Types.HasIdentity (identity)
import Neon.Types.HasMap (map)
import Neon.Types.HasPure (HasPure)

foreign import nativeFlattenArray :: forall a. Array (Array a) -> Array a

-- | Laws:
-- | - Associativity: `(x >>= f) >>= g = x >>= (\ k => f k >>= g)`
class (HasPure f) <= HasBind f where
  bind :: forall a b. f a -> (a -> f b) -> f b

instance arrayHasBind :: HasBind Array where
  bind xs f = nativeFlattenArray (map f xs)

instance functionHasbind :: HasBind (Function a) where
  bind g f = \ x -> f (g x) x

-- | Alias for `bind`.
(=<<) :: forall f a b. (HasBind f) => (a -> f b) -> f a -> f b
(=<<) f x = bind x f
infixr 1 =<<

-- | Alias for `bind`.
(>>=) :: forall f a b. (HasBind f) => f a -> (a -> f b) -> f b
(>>=) x f = bind x f
infixl 1 >>=

(>=>) :: forall f a b c. (HasBind f) => (a -> f b) -> (b -> f c) -> (a -> f c)
(>=>) f g = \ x -> f x >>= g
infixl 1 >=>

(<=<) :: forall f a b c. (HasBind f) => (b -> f c) -> (a -> f b) -> (a -> f c)
(<=<) f g = \ x -> f =<< g x
infixr 1 <=<

join :: forall f a. (HasBind f) => f (f a) -> f a
join x = x >>= identity
