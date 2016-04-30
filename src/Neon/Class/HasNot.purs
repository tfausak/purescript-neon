module Neon.Class.HasNot where

import Prelude as Prelude

-- | Represents types can be negated. This is known as
-- | [negation](https://en.wikipedia.org/wiki/Negation).
-- |
-- | ``` purescript
-- | not false -- true
-- | ```
class HasNot a where
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = Prelude.not x

instance functionHasNot :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)
