module Neon.Class.Add where

import Neon.Data as Data
import Prelude as Prelude

class Add a where
  add :: a -> a -> a

instance addArray :: Add (Array a) where
  add y x = Prelude.append x y

instance addBoolean :: Add Int where
  add y x = Prelude.add x y

instance addList :: Add (Data.List a) where
  add y x = Prelude.append x y

instance addNumber :: Add Number where
  add y x = Prelude.add x y

instance addString :: Add String where
  add y x = Prelude.append x y
