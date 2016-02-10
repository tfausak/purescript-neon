module Neon.Class.Inspect where

import Data.Foldable as Foldable
import Neon.Data as Data
import Prelude as Prelude

class Inspect a where
  inspect :: a -> String

instance inspectArray :: (Inspect a) => Inspect (Array a) where
  inspect xs = case xs of
    [] -> "[]"
    _ -> Foldable.mconcat
      ["[", Foldable.intercalate "," (Prelude.map inspect xs), "]"]

instance inspectBoolean :: Inspect Boolean where
  inspect x = Prelude.show x

instance inspectChar :: Inspect Char where
  inspect x = Prelude.show x

instance inspectError :: Inspect Data.Error where
  inspect x = Prelude.show x

instance inspectInt :: Inspect Int where
  inspect x = Prelude.show x

instance inspectList :: (Inspect a) => Inspect (Data.List a) where
  inspect xs = case xs of
    Data.Nil -> "Nil"
    Data.Cons h t -> Foldable.mconcat
      ["Cons (", inspect h, ") (", inspect t, ")"]

instance inspectNumber :: Inspect Number where
  inspect x = Prelude.show x

instance inspectString :: Inspect String where
  inspect x = Prelude.show x

instance inspectUnit :: Inspect Data.Unit where
  inspect x = Prelude.show x
