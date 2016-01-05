module Neon.Class.Add (Add, add) where

import Prelude as Prelude

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add y x = x Prelude.++ y

instance addInt :: Add Int where
  add y x = x Prelude.+ y

instance addNumber :: Add Number where
  add y x = x Prelude.+ y

instance addString :: Add String where
  add y x = x Prelude.++ y
