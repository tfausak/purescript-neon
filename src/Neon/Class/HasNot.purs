module Neon.Class.HasNot where

import Prelude as Prelude

class HasNot a where
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = Prelude.not x

instance functionHasNot :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)
