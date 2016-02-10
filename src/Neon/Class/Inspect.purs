module Neon.Class.Inspect where

import Neon.Data as Data
import Prelude as Prelude

class Inspect a where
  inspect :: a -> String

-- instance inspectArray :: (Inspect a) => Inspect (Array a) where
--   inspect xs = "" -- TODO

instance inspectBoolean :: Inspect Boolean where
  inspect x = Prelude.show x

instance inspectChar :: Inspect Char where
  inspect x = Prelude.show x

instance inspectError :: Inspect Data.Error where
  inspect x = Prelude.show x

instance inspectInt :: Inspect Int where
  inspect x = Prelude.show x

-- instance inspectList :: (Inspect a) => Inspect (Data.List a) where
--   inspect xs = "" -- TODO

instance inspectNumber :: Inspect Number where
  inspect x = Prelude.show x

instance inspectString :: Inspect String where
  inspect x = Prelude.show x

instance inspectUnit :: Inspect Data.Unit where
  inspect x = Prelude.show x
