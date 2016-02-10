module Neon.Class.Subtract where

import Data.Array as Array
import Data.Foldable as Foldable
import Data.List as List
import Neon.Class.Equal as Equal
import Neon.Data as Data
import Prelude as Prelude

class Subtract a where
  subtract :: a -> a -> a

instance subtractArray :: (Equal.Equal a) => Subtract (Array a) where
  subtract ys xs = Array.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> Equal.equal y x) ys))
    xs

instance subtractInt :: Subtract Int where
  subtract y x = Prelude.sub x y

instance subtractList :: (Equal.Equal a) => Subtract (Data.List a) where
  subtract ys xs = List.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> Equal.equal y x) ys))
    xs

instance subtractNumber :: Subtract Number where
  subtract y x = Prelude.sub x y
