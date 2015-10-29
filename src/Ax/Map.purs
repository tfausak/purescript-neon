module Ax.Map
  ( Map
  , map
  ) where

import Ax.Compose ((>>))

foreign import jsMapArray :: forall a b. (a -> b) -> Array a -> Array b

class Map f where
  map :: forall a b. (a -> b) -> f a -> f b

instance mapArray :: Map Array where
  map f x = jsMapArray f x

instance mapFunction :: Map (Function a) where
  map f g = g >> f
