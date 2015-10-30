module Neon.Compose
  ( Compose
  , compose
  , (<<)
  , (>>)
  ) where

-- | Laws:
-- | - Associativity: `f >> (g >> h) = (f >> g) >> h`
class Compose f where
  compose :: forall a b c. f a b -> f b c -> f a c

instance composeFunction :: Compose Function where
  compose f g = \ x -> g (f x)

-- | Alias for `compose`.
(<<) :: forall f a b c. (Compose f) => f b c -> f a b -> f a c
(<<) g f = compose f g
infixr 9 <<

-- | Alias for `compose`.
(>>) :: forall f a b c. (Compose f) => f a b -> f b c -> f a c
(>>) f g = compose f g
infixr 9 >>
