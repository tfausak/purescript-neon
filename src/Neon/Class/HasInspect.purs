module Neon.Class.HasInspect where

import Data.Foldable as Foldable
import Neon.Data as Data
import Prelude as Prelude

class HasInspect a where
  inspect :: a -> String

instance arrayHasInspect :: (HasInspect a) => HasInspect (Array a) where
  inspect xs = case xs of
    [] -> "[]"
    _ -> Foldable.mconcat
      ["[", Foldable.intercalate "," (Prelude.map inspect xs), "]"]

instance booleanHasInspect :: HasInspect Boolean where
  inspect x = Prelude.show x

instance charHasInspect :: HasInspect Char where
  inspect x = Prelude.show x

instance errorHasInspect :: HasInspect Data.Error where
  inspect x = Prelude.show x

instance functionHasInspect :: HasInspect (a -> b) where
  inspect _ = "{- Function -}"

instance intHasInspect :: HasInspect Int where
  inspect x = Prelude.show x

instance listHasInspect :: (HasInspect a) => HasInspect (Data.List a) where
  inspect xs = case xs of
    Data.Nil -> "Nil"
    Data.Cons h t -> Foldable.mconcat
      ["Cons (", inspect h, ") (", inspect t, ")"]

instance numberHasInspect :: HasInspect Number where
  inspect x = Prelude.show x

instance objectHasInspect :: HasInspect { | a } where
  inspect _ = "{- Object -}"

instance stringHasInspect :: HasInspect String where
  inspect x = Prelude.show x

instance unitHasInspect :: HasInspect Data.Unit where
  inspect x = Prelude.show x
