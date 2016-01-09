module Neon.Class.Add (Add, add) where

import Prelude as Prelude

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add y x = Prelude.append x y

instance addInt :: Add Int where
  add y x = Prelude.add x y

instance addNumber :: Add Number where
  add y x = Prelude.add x y

instance addString :: Add String where
  add y x = Prelude.append x y
