module Neon.Class.Filter where

foreign import nativeFilterArray :: forall a. (a -> Boolean) -> Array a -> Array a

class Filter a where
  filter :: forall b. (b -> Boolean) -> a b -> a b

instance filterArray :: Filter Array where
  filter = nativeFilterArray
