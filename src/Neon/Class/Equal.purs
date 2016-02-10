module Neon.Class.Equal where

import Data.Array as Array
import Data.Foldable as Foldable
import Data.Tuple as Tuple
import Prelude as Prelude

class Equal a where
  equal :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  equal ys xs = Prelude.conj
    (Prelude.eq (Array.length xs) (Array.length ys))
    (Foldable.all (\ (Tuple.Tuple x y) -> equal y x) (Array.zip xs ys))

instance equalBoolean :: Equal Boolean where
  equal y x = Prelude.eq x y

instance equalChar :: Equal Char where
  equal y x = Prelude.eq x y

instance equalInt :: Equal Int where
  equal y x = Prelude.eq x y

instance equalNumber :: Equal Number where
  equal y x = Prelude.eq x y

instance equalString :: Equal String where
  equal y x = Prelude.eq x y
