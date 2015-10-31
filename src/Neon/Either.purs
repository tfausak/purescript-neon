module Neon.Either
  ( Either(Left, Right)
  ) where

import Neon.Add (Add, add, (+))
import Neon.Alternative (Alternative)
import Neon.And (And, and)
import Neon.Apply (Apply, (<*>))
import Neon.Bind (Bind, bind)
import Neon.Bounded (Bounded, bottom, top)
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

data Either a b
  = Left a
  | Right b

instance addEither :: (Add b) => Add (Either a b) where
  add x y = add <$> x <*> y

instance alternativeEither :: Alternative (Either a) where
  alternative (Left _) y = y
  alternative x _ = x

instance andEither :: (Bounded a, And b) => And (Either a b) where
  and x y = and <$> x <*> y

instance applyEither :: Apply (Either a) where
  apply (Right f) x = f <$> x
  apply (Left x) _ = Left x

instance bindEither :: Bind (Either a) where
  bind (Left x) _ = Left x
  bind (Right x) f = f x

instance boundedEither :: (Bounded a, Bounded b) => Bounded (Either a b) where
  bottom = Left bottom
  top = Right top

instance compareEither :: (Compare a, Compare b) => Compare (Either a b) where
  compare (Left x) (Left y) = compare x y
  compare (Right x) (Right y) = compare x y
  compare (Left _) _ = LessThan
  compare _ (Left _) = GreaterThan

instance divideEither :: (Divide b) => Divide (Either a b) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance equalEither :: (Equal a, Equal b) => Equal (Either a b) where
  equal (Left x) (Left y) = x == y
  equal (Right x) (Right y) = x == y
  equal _ _ = false

instance mapEither :: Map (Either a) where
  map f (Right x) = Right (f x)
  map _ (Left x) = Left x

instance multiplyEither :: (Multiply b) => Multiply (Either a b) where
  multiply x y = multiply <$> x <*> y

instance notEither :: (Bounded a, Not b) => Not (Either a b) where
  not x = not <$> x

instance oneEither :: (One b) => One (Either a b) where
  one = Right one

instance orEither :: (Bounded a, Or b) => Or (Either a b) where
  or x y = or <$> x <*> y

instance pureEither :: Pure (Either a) where
  pure x = Right x

instance showEither :: (Show a, Show b) => Show (Either a b) where
  show (Left x) = "Left (" + show x + ")"
  show (Right x) = "Right (" + show x + ")"

instance subtractEither :: (Subtract b) => Subtract (Either a b) where
  subtract x y = subtract <$> x <*> y

instance zeroEither :: (Zero b) => Zero (Either a b) where
  zero = Right zero
