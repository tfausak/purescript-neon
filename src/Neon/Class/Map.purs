module Neon.Class.Map (Map, map) where

foreign import nativeMapArray :: forall a b. (a -> b) -> Array a -> Array b

class Map a where
  map :: forall b c. (b -> c) -> a b -> a c

instance mapArray :: Map Array where
  map = nativeMapArray
