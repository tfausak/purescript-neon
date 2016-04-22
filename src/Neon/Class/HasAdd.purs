module Neon.Class.HasAdd where

import Neon.Data as Data
import Prelude as Prelude

class HasAdd a where
  add :: a -> a -> a

instance arrayHasAdd :: HasAdd (Array a) where
  add y x = Prelude.append x y

instance booleanHasAdd :: HasAdd Int where
  add y x = Prelude.add x y

instance listHasAdd :: HasAdd (Data.List a) where
  add y x = Prelude.append x y

instance numberHasAdd :: HasAdd Number where
  add y x = Prelude.add x y

instance stringHasAdd :: HasAdd String where
  add y x = Prelude.append x y
