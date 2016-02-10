module Neon.Class.Subtract where

import Neon.Class.Equal as Equal
import Data.Array as Array
import Data.Foldable as Foldable
import Prelude as Prelude

class Subtract a where
  subtract :: a -> a -> a

instance subtractArray :: (Equal.Equal a) => Subtract (Array a) where
  subtract ys xs = Array.filter
    (\ x -> Prelude.not (Foldable.any (\ y -> Equal.equal y x) ys))
    xs

instance subtractInt :: Subtract Int where
  subtract y x = Prelude.sub x y

instance subtractNumber :: Subtract Number where
  subtract y x = Prelude.sub x y
