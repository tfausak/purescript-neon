module Neon.Class.Not (class Not, not) where

import Prelude (..) as Prelude

-- | Represents types can be negated. This is known as
-- | [negation](https://en.wikipedia.org/wiki/Negation).
-- |
-- | ``` purescript
-- | not false -- true
-- | ```
-- |
-- | Laws:
-- | - `not top = bottom`
-- | - `not bottom = top`
class Not a where
  not :: a -> a

instance notBoolean :: Not Boolean where
  not x = Prelude.not x

instance notFunction :: (Not b) => Not (a -> b) where
  not f = \ x -> not (f x)
