module Neon.Class.HasEqual where

import Data.Array as Array
import Data.Foldable as Foldable
import Data.List as List
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be equal to each other.
-- |
-- | ``` purescript
-- | equal 1 2 -- false
-- | equal 3 3 -- true
-- | ```
class HasEqual a where
  equal :: a -> a -> Boolean

instance arrayHasEqual :: (HasEqual a) => HasEqual (Array a) where
  equal ys xs = Prelude.conj
    (Prelude.eq (Array.length xs) (Array.length ys))
    (Foldable.all (\ (Data.Tuple x y) -> equal y x) (Array.zip xs ys))

instance booleanHasEqual :: HasEqual Boolean where
  equal y x = Prelude.eq x y

instance charHasEqual :: HasEqual Char where
  equal y x = Prelude.eq x y

instance intHasEqual :: HasEqual Int where
  equal y x = Prelude.eq x y

instance listHasEqual :: (HasEqual a) => HasEqual (Data.List a) where
  equal ys xs = Prelude.conj
    (Prelude.eq (List.length xs) (List.length ys))
    (Foldable.all (\ (Data.Tuple x y) -> equal y x) (List.zip xs ys))

instance numberHasEqual :: HasEqual Number where
  equal y x = Prelude.eq x y

instance orderingHasEqual :: HasEqual Data.Ordering where
  equal y x = Prelude.eq x y

instance stringHasEqual :: HasEqual String where
  equal y x = Prelude.eq x y

instance unitHasEqual :: HasEqual Data.Unit where
  equal y x = Prelude.eq x y
