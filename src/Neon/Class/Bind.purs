module Neon.Class.Bind (class Bind, bind) where

foreign import nativeBindArray :: forall a b. Array a -> (a -> Array b) -> Array b

class Bind a where
  bind :: forall b c. a b -> (b -> a c) -> a c

instance bindArray :: Bind Array where
  bind = nativeBindArray
