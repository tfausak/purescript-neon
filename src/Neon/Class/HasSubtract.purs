module Neon.Class.HasSubtract where

import Data.Array as Array
import Data.Foldable as Foldable
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be subtracted from each other.
-- |
-- | ``` purescript
-- | 3 :subtract 2 -- 1
-- | ```
class HasSubtract a where
  subtract :: a -> a -> a

instance arrayHasSubtract :: (HasEqual.HasEqual a) => HasSubtract (Array a) where
  subtract ys xs = Array.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> HasEqual.equal y x) ys))
    xs

instance intHasSubtract :: HasSubtract Int where
  subtract y x = Prelude.sub x y

instance listHasSubtract :: (HasEqual.HasEqual a) => HasSubtract (Data.List a) where
  subtract ys xs = List.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> HasEqual.equal y x) ys))
    xs

instance numberHasSubtract :: HasSubtract Number where
  subtract y x = Prelude.sub x y
