module Neon.Class.HasOr where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be disjoined. This is also known as
-- | [logical disjunction](https://en.wikipedia.org/wiki/Logical_disjunction).
-- |
-- | ``` purescript
-- | true :or false -- true
-- | ```
-- |
-- | Some types can't be disjoined per se but it is still useful to be able to
-- | use the `||` operator with them. For example, you can `or` two arrays
-- | together to get their union.
-- |
-- | ``` purescript
-- | [1, 2, 3] :or [2, 3, 4] -- [1, 2, 3, 4]
-- | ```
-- |
-- | For integers, `or` is bitwise.
-- |
-- | ``` purescript
-- | 5 :or 2 -- 7
-- | ```
-- |
-- | The instance for functions is perhaps the hardest to understand. Combining
-- | two functions with `or` returns a new function that calls each function
-- | and then `or`s the results together.
-- |
-- | ``` purescript
-- | even :or odd -- \ x -> (even x) :or (odd x)
-- | (even :or odd) 3 -- true
-- | ```
class HasOr a where
  or :: a -> a -> a

instance arrayHasOr :: (HasEqual.HasEqual a) => HasOr (Array a) where
  or ys xs = Array.unionBy (\ x y -> HasEqual.equal y x) xs ys

instance booleanHasOr :: HasOr Boolean where
  or y x = Prelude.disj x y

instance functionHasOr :: (HasOr b) => HasOr (a -> b) where
  or g f = \ x -> or (g x) (f x)

instance intHasOr :: HasOr Int where
  or y x = x Bits..|. y

instance listHasOr :: (HasEqual.HasEqual a) => HasOr (Data.List a) where
  or ys xs = List.unionBy (\ x y -> HasEqual.equal y x) xs ys
