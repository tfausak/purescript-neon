module Neon.Class.HasAnd where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be conjoined. This is also known as [logical
-- | conjunction](https://en.wikipedia.org/wiki/Logical_conjunction).
-- |
-- | ``` purescript
-- | true :and false -- false
-- | [2, 3] :add [1, 2] -- [2]
-- | ```
class HasAnd a where
  and :: a -> a -> a

instance arrayHasAnd :: (HasEqual.HasEqual a) => HasAnd (Array a) where
  and ys xs = Array.intersectBy (\ x y -> HasEqual.equal y x) xs ys

instance booleanHasAnd :: HasAnd Boolean where
  and y x = Prelude.conj x y

instance functionHasAnd :: (HasAnd b) => HasAnd (a -> b) where
  and g f = \ x -> and (g x) (f x)

instance intHasAnd :: HasAnd Int where
  and y x = x Bits..&. y

instance listHasAnd :: (HasEqual.HasEqual a) => HasAnd (Data.List a) where
  and ys xs = List.intersectBy (\ x y -> HasEqual.equal y x) xs ys
