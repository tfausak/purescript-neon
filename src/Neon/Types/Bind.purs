module Neon.Types.Bind
  ( Bind
  , bind
  , (=<<)
  , (>>=)
  ) where

import Neon.Types.Apply (apply)
import Neon.Types.Map (map)
import Neon.Types.Pure (Pure)

foreign import nativeFlattenArray :: forall a. Array (Array a) -> Array a

-- | Laws:
-- | - Associativity: `(x >>= f) >>= g = x >>= (\ k => f k >>= g)`
class (Pure f) <= Bind f where
  bind :: forall a b. f a -> (a -> f b) -> f b

instance bindArray :: Bind Array where
  bind xs f = nativeFlattenArray (map (\ x -> f x) xs)

instance bindFunction :: Bind (Function a) where
  bind g f = \ x -> f (g x) x

-- | Alias for `bind`.
(=<<) :: forall f a b. (Bind f) => (a -> f b) -> f a -> f b
(=<<) f x = bind x f
infixr 1 =<<

-- | Alias for `bind`.
(>>=) :: forall f a b. (Bind f) => f a -> (a -> f b) -> f b
(>>=) x f = bind x f
infixl 1 >>=
