module Neon.Class.HasNot where

import Prelude as Prelude

-- | Represents types can be negated. This is known as
-- | [negation](https://en.wikipedia.org/wiki/Negation).
-- |
-- | ``` purescript
-- | not false -- true
-- | ```
-- |
-- | The instance for functions is a little tricky. Calling `not` on a function
-- | returns a new function that calls the original function and then `not`s
-- | the result.
-- |
-- | ``` purescript
-- | not even -- \ x -> not (even x)
-- | (not even) 3 -- true
-- | ```
class HasNot a where
  not :: a -> a

instance booleanHasNot :: HasNot Boolean where
  not x = Prelude.not x

instance functionHasNot :: (HasNot b) => HasNot (a -> b) where
  not f = \ x -> not (f x)
