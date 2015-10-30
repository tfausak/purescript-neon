module Neon.Maybe
  ( Maybe(Nothing, Just)
  ) where

import Neon.Add (Add, add, (+))
import Neon.Alternative (Alternative)
import Neon.And (And, and)
import Neon.Apply (Apply, (<*>))
import Neon.Bind (Bind, bind)
import Neon.Bounded (Bounded, top)
import Neon.Compare (Compare, compare)
import Neon.Divide (Divide, divide, modulo)
import Neon.Empty (Empty)
import Neon.Equal (Equal, (==))
import Neon.Ordering (Ordering(LessThan, EqualTo, GreaterThan))
import Neon.Map (Map, (<$>))
import Neon.Multiply (Multiply, multiply)
import Neon.Not (Not, not)
import Neon.One (One, one)
import Neon.Or (Or, or)
import Neon.Pure (Pure)
import Neon.Show (Show, show)
import Neon.Subtract (Subtract, subtract)
import Neon.Zero (Zero, zero)

data Maybe a
  = Nothing
  | Just a

instance addMaybe :: (Add a) => Add (Maybe a) where
  add x y = add <$> x <*> y

instance alternativeMaybe :: Alternative Maybe where
  alternative Nothing y = y
  alternative x _ = x

instance andMaybe :: (And a) => And (Maybe a) where
  and x y = and <$> x <*> y

instance applyMaybe :: Apply Maybe where
  apply (Just f) (Just x) = Just (f x)
  apply _ _ = Nothing

instance bindMaybe :: Bind Maybe where
  bind Nothing _ = Nothing
  bind (Just x) f = f x

instance boundedMaybe :: (Bounded a) => Bounded (Maybe a) where
  bottom = Nothing
  top = Just top

instance compareMaybe :: (Compare a) => Compare (Maybe a) where
  compare (Just x) (Just y) = compare x y
  compare Nothing Nothing = EqualTo
  compare Nothing _ = LessThan
  compare _ Nothing = GreaterThan

instance divideMaybe :: (Divide a) => Divide (Maybe a) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance emptyMaybe :: Empty Maybe where
  empty = Nothing

instance equalMaybe :: (Equal a) => Equal (Maybe a) where
  equal Nothing Nothing = true
  equal (Just x) (Just y) = x == y
  equal _ _ = false

instance mapMaybe :: Map Maybe where
  map _ Nothing = Nothing
  map f (Just x) = Just (f x)

instance multiplyMaybe :: (Multiply a) => Multiply (Maybe a) where
  multiply x y = multiply <$> x <*> y

instance notMaybe :: (Not a) => Not (Maybe a) where
  not x = not <$> x

instance oneMaybe :: (One a) => One (Maybe a) where
  one = Just one

instance orMaybe :: (Or a) => Or (Maybe a) where
  or x y = or <$> x <*> y

instance pureMaybe :: Pure Maybe where
  pure x = Just x

instance showMaybe :: (Show a) => Show (Maybe a) where
  show Nothing = "Nothing"
  show (Just x) = "Just (" + show x + ")"

instance subtractMaybe :: (Subtract a) => Subtract (Maybe a) where
  subtract x y = subtract <$> x <*> y

instance zeroMaybe :: (Zero a) => Zero (Maybe a) where
  zero = Just zero
