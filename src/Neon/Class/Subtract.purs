module Neon.Class.Subtract where

import Data.Array as Array
import Data.Foldable as Foldable
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

class Subtract a where
  subtract :: a -> a -> a

instance subtractArray :: (HasEqual.HasEqual a) => Subtract (Array a) where
  subtract ys xs = Array.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> HasEqual.equal y x) ys))
    xs

instance subtractInt :: Subtract Int where
  subtract y x = Prelude.sub x y

instance subtractList :: (HasEqual.HasEqual a) => Subtract (Data.List a) where
  subtract ys xs = List.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> HasEqual.equal y x) ys))
    xs

instance subtractNumber :: Subtract Number where
  subtract y x = Prelude.sub x y
