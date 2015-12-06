module Neon.Class.Add (Add, add) where

foreign import nativeAdd :: forall a. a -> a -> a
foreign import nativeAddArray :: forall a. Array a -> Array a -> Array a

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add = nativeAddArray

instance addInt :: Add Int where
  add = nativeAdd

instance addNumber :: Add Number where
  add = nativeAdd

instance addString :: Add String where
  add = nativeAdd
