module Neon.Types.Map
  ( Map
  , map
  , (<$>)
  ) where

import Neon.Types.Compose ((>>))
import Neon.Values.Unit (Unit(), unit)

foreign import nativeMapArray :: forall a b. (a -> b) -> Array a -> Array b

-- | Laws:
-- | - Identity: `map identity = identity`
-- | - Composition: `map (f >> g) = map f >> map g`
class Map f where
  map :: forall a b. (a -> b) -> f a -> f b

instance mapArray :: Map Array where
  map f x = nativeMapArray f x

instance mapFunction :: Map (Function a) where
  map f g = g >> f

-- | Alias for `map`.
(<$>) :: forall f a b. (Map f) => (a -> b) -> f a -> f b
(<$>) f x = map f x
infixl 4 <$>
