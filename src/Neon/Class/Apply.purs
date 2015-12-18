module Neon.Class.Apply (class Apply, apply) where

foreign import nativeApplyArray :: forall a b. Array (a -> b) -> Array a -> Array b

class Apply a where
  apply :: forall b c. a (b -> c) -> a b -> a c

instance applyArray :: Apply Array where
  apply = nativeApplyArray
