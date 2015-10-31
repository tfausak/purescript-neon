module Neon.Values.Maybe
  ( Maybe(Nothing, Just)
  ) where

import Neon.Types.Add (Add, add, (+))
import Neon.Types.Alternative (Alternative)
import Neon.Types.And (And, and)
import Neon.Types.Apply (Apply, (<*>))
import Neon.Types.Bind (Bind, bind)
import Neon.Types.Bounded (Bounded, top)
import Neon.Types.Compare (Compare, compare)
import Neon.Types.Divide (Divide, divide, modulo)
import Neon.Types.Empty (Empty)
import Neon.Types.Equal (Equal, (==))
import Neon.Values.Ordering (Ordering(LessThan, EqualTo, GreaterThan))
import Neon.Types.Map (Map, (<$>))
import Neon.Types.Multiply (Multiply, multiply)
import Neon.Types.Not (Not, not)
import Neon.Types.One (One, one)
import Neon.Types.Or (Or, or)
import Neon.Types.Pure (Pure)
import Neon.Types.Show (Show, show)
import Neon.Types.Subtract (Subtract, subtract)
import Neon.Types.Zero (Zero, zero)

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
  apply (Just f) x = f <$> x
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
