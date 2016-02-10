module Neon.Class.Inspect where

import Prelude as Prelude

class Inspect a where
  inspect :: a -> String

-- instance inspectArray :: (Inspect a) => Inspect (Array a) where
--   inspect xs = "" -- TODO

instance inspectBoolean :: Inspect Boolean where
  inspect x = Prelude.show x

instance inspectChar :: Inspect Char where
  inspect x = Prelude.show x

instance inspectInt :: Inspect Int where
  inspect x = Prelude.show x

instance inspectNumber :: Inspect Number where
  inspect x = Prelude.show x

instance inspectString :: Inspect String where
  inspect x = Prelude.show x
