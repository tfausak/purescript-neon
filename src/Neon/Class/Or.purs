module Neon.Class.Or (Or, or) where

import Prelude as Prelude

-- | Represents types than can be disjoined. This is also known as
-- | [logical disjunction](https://en.wikipedia.org/wiki/Logical_disjunction).
-- |
-- | Examples:
-- | ``` purescript
-- | or false true -- true
-- | ```
-- |
-- | Laws:
-- | - `x || (y || z) = (x || y) || z`
-- | - `x || y = y || x`
-- | - `x || bottom = x`
-- | - `x || top = top`
-- | - `x || x = x`
class Or a where
  or :: a -> a -> a

-- TODO: instance orArray

instance orBoolean :: Or Boolean where
  or y x = Prelude.disj x y

instance orFunction :: (Or b) => Or (a -> b) where
  or g f = \ x -> or (g x) (f x)

-- TODO: instance orList
