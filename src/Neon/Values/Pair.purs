module Neon.Values.Pair
  ( Pair(Pair)
  , pair
  ) where

import Neon.Types
import Neon.Values.Ordering

-- TODO: purescript/purescript#1595
import Neon.Types.Apply
import Neon.Types.Bind
import Neon.Types.Compose
import Neon.Types.Fold
import Neon.Types.Map
import Neon.Types.Pure

newtype Pair a b = Pair { first :: a, second :: b }

instance addPair :: (Add a, Add b) => Add (Pair a b) where
  add (Pair x) (Pair y) = pair (x.first + y.first) (x.second + y.second)

instance andPair :: (And a, And b) => And (Pair a b) where
  and (Pair x) (Pair y) = pair (x.first && y.first) (x.second && y.second)

instance applyPair :: (Add a) => Apply (Pair a) where
  apply (Pair x) (Pair y) = pair (x.first + y.first) (x.second y.second)

-- TODO: Why is this zero instance necessary?
instance bindPair :: (Add a, Zero a) => Bind (Pair a) where
  bind (Pair x) f = case f x.second of
    Pair y -> pair (x.first + y.first) y.second

instance boundedPair :: (Bounded a, Bounded b) => Bounded (Pair a b) where
  bottom = pair bottom bottom
  top = pair top top

instance comparePair :: (Compare a, Compare b) => Compare (Pair a b) where
  compare (Pair x) (Pair y) = case compare x.first y.first of
    EqualTo -> compare x.second y.second
    c -> c

instance composePair :: Compose Pair where
  compose (Pair x) (Pair y) = pair x.first y.second

instance dividePair :: (Divide a, Divide b) => Divide (Pair a b) where
  divide (Pair x) (Pair y) = pair (x.first / y.first) (x.second / y.second)
  modulo (Pair x) (Pair y) = pair (x.first % y.first) (x.second % y.second)

instance equalPair :: (Equal a, Equal b) => Equal (Pair a b) where
  equal (Pair x) (Pair y) = x.first == y.first && x.second == y.second

instance foldPair :: Fold (Pair x) where
  foldl f y (Pair x) = f y x.second
  foldr f y (Pair x) = f x.second y

instance mapPair :: Map (Pair a) where
  map f (Pair x) = pair x.first (f x.second)

instance multiplyPair :: (Multiply a, Multiply b) => Multiply (Pair a b) where
  multiply (Pair x) (Pair y) = pair (x.first * y.first) (x.second * y.second)

instance notPair :: (Not a, Not b) => Not (Pair a b) where
  not (Pair x) = pair (not x.first) (not x.second)

instance onePair :: (One a, One b) => One (Pair a b) where
  one = pair one one

instance orPair :: (Or a, Or b) => Or (Pair a b) where
  or (Pair x) (Pair y) = pair (x.first || y.first) (x.second || y.second)

instance purePair :: (Zero a) => Pure (Pair a) where
  pure x = pair zero x

instance showPair :: (Show a, Show b) => Show (Pair a b) where
  show (Pair x)
    = "Pair { first: "
    + show x.first
    + ", second: "
    + show x.second + " }"

instance subtractPair :: (Subtract a, Subtract b) => Subtract (Pair a b) where
  subtract (Pair x) (Pair y) = pair (x.first - y.first) (x.second - y.second)

instance zeroPair :: (Zero a, Zero b) => Zero (Pair a b) where
  zero = pair zero zero

pair :: forall a b. a -> b -> Pair a b
pair x y = Pair { first: x, second: y }
