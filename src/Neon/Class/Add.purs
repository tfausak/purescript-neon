module Neon.Class.Add (Add, add) where

import Neon.Primitive.Int (toNumber)
import Neon.Primitive.Number (truncate)

foreign import nativeAdd :: forall a. a -> a -> a
foreign import nativeAddArray :: forall a. Array a -> Array a -> Array a

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add = nativeAddArray

instance addInt :: Add Int where
  add x y = truncate (add (toNumber x) (toNumber y))

instance addNumber :: Add Number where
  add = nativeAdd

instance addString :: Add String where
  add = nativeAdd
