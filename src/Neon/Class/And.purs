module Neon.Class.And where

import Data.Array as Array
import Data.List as List
import Neon.Class.Equal as Equal
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be conjoined. This is also known as [logical
-- | conjunction](https://en.wikipedia.org/wiki/Logical_conjunction).
-- |
-- | ``` purescript
-- | and false true -- false
-- | add [1, 2] [2, 3] -- [2]
-- | ```
-- |
-- | Laws:
-- | - `x && x = x`
-- | - `x && (y && z) = (x && y) && z`
-- | - `x && y = y && x`
-- | - `x && top = x`
-- | - `x && bottom = bottom`
class And a where
  and :: a -> a -> a

instance andArray :: (Equal.Equal a) => And (Array a) where
  and ys xs = Array.intersectBy (\ x y -> Equal.equal y x) xs ys

instance andBoolean :: And Boolean where
  and y x = Prelude.conj x y

instance andFunction :: (And b) => And (a -> b) where
  and g f = \ x -> and (g x) (f x)

instance andList :: (Equal.Equal a) => And (Data.List a) where
  and ys xs = List.intersectBy (\ x y -> Equal.equal y x) xs ys
