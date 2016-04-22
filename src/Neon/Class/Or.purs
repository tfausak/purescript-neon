module Neon.Class.Or where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon.Class.HasEqual as HasEqual
import Neon.Data as Data
import Prelude as Prelude

class Or a where
  or :: a -> a -> a

instance orArray :: (HasEqual.HasEqual a) => Or (Array a) where
  or ys xs = Array.unionBy (\ x y -> HasEqual.equal y x) xs ys

instance orBoolean :: Or Boolean where
  or y x = Prelude.disj x y

instance orFunction :: (Or b) => Or (a -> b) where
  or g f = \ x -> or (g x) (f x)

instance orInt :: Or Int where
  or y x = x Bits..|. y

instance orList :: (HasEqual.HasEqual a) => Or (Data.List a) where
  or ys xs = List.unionBy (\ x y -> HasEqual.equal y x) xs ys
