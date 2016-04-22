module Neon.Class.HasAnd where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon.Class.Equal as Equal
import Neon.Data as Data
import Prelude as Prelude

class HasAnd a where
  and :: a -> a -> a

instance arrayHasAnd :: (Equal.Equal a) => HasAnd (Array a) where
  and ys xs = Array.intersectBy (\ x y -> Equal.equal y x) xs ys

instance booleanHasAnd :: HasAnd Boolean where
  and y x = Prelude.conj x y

instance functionHasAnd :: (HasAnd b) => HasAnd (a -> b) where
  and g f = \ x -> and (g x) (f x)

instance intHasAnd :: HasAnd Int where
  and y x = x Bits..&. y

instance listHasAnd :: (Equal.Equal a) => HasAnd (Data.List a) where
  and ys xs = List.intersectBy (\ x y -> Equal.equal y x) xs ys
