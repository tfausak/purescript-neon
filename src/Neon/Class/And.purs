module Neon.Class.And (And, and) where

import Data.Array as Array
import Data.List as List
import Neon.Class.Equal (Equal, equal)
import Neon.Data (List())
import Prelude as Prelude

class And a where
  and :: a -> a -> a

instance andArray :: (Equal a) => And (Array a) where
  and ys xs = Array.intersectBy (\ x y -> equal y x) xs ys

instance andBoolean :: And Boolean where
  and y x = Prelude.conj x y

instance andFunction :: (And b) => And (a -> b) where
  and g f = \ x -> and (g x) (f x)

instance andList :: (Equal a) => And (List a) where
  and ys xs = List.intersectBy (\ x y -> equal y x) xs ys
