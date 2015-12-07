module Neon.Class.Reduce (Reduce, reduce) where

foreign import nativeReduceArray :: forall a b. (b -> a -> b) -> b -> Array a -> b

class Reduce a where
  reduce :: forall b c. (c -> b -> c) -> c -> a b -> c

instance reduceArray :: Reduce Array where
  reduce = nativeReduceArray
