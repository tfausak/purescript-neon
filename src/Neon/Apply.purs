module Neon.Apply
  ( Apply
  , apply
  , (<*>)
  ) where

import Neon.Map (Map, map)

foreign import nativeFlattenArray :: forall a. Array (Array a) -> Array a

-- | Laws:
-- | - Associative composition: `(<<) <$> f <*> g <*> h = f <*> (g <*> h)`
class (Map f) <= Apply f where
  apply :: forall a b. f (a -> b) -> f a -> f b

instance applyArray :: Apply Array where
  apply fs xs = nativeFlattenArray (map (\ f -> map (\ x -> f x) xs) fs)

instance applyFunction :: Apply (Function a) where
  apply f g = \ x -> f x (g x)

-- | Alias for `apply`.
(<*>) :: forall f a b. (Apply f) => f (a -> b) -> f a -> f b
(<*>) f x = apply f x
infixl 4 <*>
