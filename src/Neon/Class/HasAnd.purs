module Neon.Class.HasAnd where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be conjoined. This is also known as
-- | [logical conjunction](https://en.wikipedia.org/wiki/Logical_conjunction).
-- |
-- | ``` purescript
-- | true :and false -- false
-- | ```
-- |
-- | Some types can't be conjoined per se but it is still useful to be able to
-- | use the `&&` operator with them. For example, you can `and` two arrays
-- | together to get their intersection.
-- |
-- | ``` purescript
-- | [1, 2, 3] :and [2, 3, 4] -- [2, 3]
-- | ```
-- |
-- | For integers, `and` is bitwise.
-- |
-- | ``` purescript
-- | 5 :and 3 -- 3
-- | ```
-- |
-- | The instance for functions is perhaps the hardest to understand. Combining
-- | two functions with `and` returns a new function that calls each function
-- | and then `and`s the results together.
-- |
-- | ``` purescript
-- | even :and odd -- \ x -> (even x) :and (odd x)
-- | (even :and odd) 3 -- false
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
