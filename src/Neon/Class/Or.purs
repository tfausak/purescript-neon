module Neon.Class.Or (Or, or) where

import Data.Array as Array
import Data.List as List
import Neon.Class.Equal (Equal, equal)
import Neon.Data (List())
import Prelude as Prelude

-- | Represents types than can be disjoined. This is also known as
-- | [logical disjunction](https://en.wikipedia.org/wiki/Logical_disjunction).
-- |
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

instance orArray :: (Equal a) => Or (Array a) where
  or ys xs = Array.unionBy (\ x y -> equal x y) xs ys

instance orBoolean :: Or Boolean where
  or y x = Prelude.disj x y

instance orFunction :: (Or b) => Or (a -> b) where
  or g f = \ x -> or (g x) (f x)

instance andList :: (Equal a) => Or (List a) where
  or ys xs = List.unionBy (\ x y -> equal y x) xs ys
