module Neon.Helper
  ( absoluteValue
  , all
  , any
  , clamp
  , contains
  , curry
  , decrement
  , for
  , greaterOrEqual
  , increment
  , isEmpty
  , isInfinite
  , isJust
  , isNothing
  , join
  , lessOrEqual
  , max
  , maximum
  , min
  , minimum
  , negate
  , notEqual
  , product
  , range
  , reciprocal
  , sequence
  , sign
  , size
  , sum
  , swap
  , uncurry
  , unsafeFromJust
  , unsafeLog
  , withDefault
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.And (And, and)
import Neon.Class.Always (always)
import Neon.Class.Apply (Apply)
import Neon.Class.Bind (Bind, bind)
import Neon.Class.Bottom (Bottom, bottom)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.Flip (flip)
import Neon.Class.FromInt (FromInt, fromInt)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Identity (identity)
import Neon.Class.Less (Less, less)
import Neon.Class.Map (Map, map)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Or (Or, or)
import Neon.Class.Pure (Pure, pure)
import Neon.Class.Traverse (Traverse, traverse)
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.ToInt (ToInt, toInt)
import Neon.Class.Zero (Zero, zero)
import Neon.Data.Exception (exception)
import Neon.Data.Maybe (Maybe(Nothing, Just), maybe)
import Neon.Data.Pair (Pair(Pair), pair)
import Neon.Effect.Console (log)
import Neon.Effect.Effect (unsafeRunEffect)
import Neon.Effect.Exception (throw)
import Neon.Primitive.Number (isFinite)

absoluteValue :: forall a. (Less a, Subtract a, Zero a) => a -> a
absoluteValue x = if less x zero then negate x else x

all :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = reduce (\ a x -> and a (p x)) true xs

any :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = reduce (\ a x -> or a (p x)) bottom xs

clamp :: forall a. (Greater a, Less a) => a -> a -> a -> a
clamp b t x =
  if greater b t
  then clamp t b x
  else max b (min t x)

contains :: forall a b. (Equal b, Reduce a) => b -> a b -> Boolean
contains x = any (equal x)

curry :: forall a b c. (Pair a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (pair x y)

decrement :: forall a. (FromInt a, ToInt a) => a -> Maybe a
decrement x = fromInt (subtract (toInt x) 1)

for :: forall a b c. (Map a) => a b -> (b -> c) -> a c
for = flip map

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual x y = or (greater x y) (equal x y)

increment :: forall a. (FromInt a, ToInt a) => a -> Maybe a
increment x = fromInt (add (toInt x) 1)

isEmpty :: forall a b. (Reduce a) => a b -> Boolean
isEmpty = all (always false)

isInfinite :: Number -> Boolean
isInfinite x = not (isFinite x)

isJust :: forall a. Maybe a -> Boolean
isJust = maybe (always true) false

isNothing :: forall a. Maybe a -> Boolean
isNothing x = not (isJust x)

join :: forall a b. (Bind a) => a (a b) -> a b
join = flip bind identity

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual x y = or (less x y) (equal x y)

max :: forall a. (Greater a) => a -> a -> a
max x y = unsafeFromJust (maximum [x, y])

maximum :: forall a b. (Greater b, Reduce a) => a b -> Maybe b
maximum = reduce
  (\ a x -> maybe (\ j -> Just (if greater j x then j else x)) (Just x) a)
  Nothing

min :: forall a. (Less a) => a -> a -> a
min x y = unsafeFromJust (minimum [x, y])

minimum :: forall a b. (Less b, Reduce a) => a b -> Maybe b
minimum = reduce
  (\ a x -> maybe (\ j -> Just (if less j x then j else x)) (Just x) a)
  Nothing

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual x y = not (equal x y)

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product = reduce multiply one

range :: forall a. (FromInt a, Greater a, ToInt a) => a -> a -> Array a
range l h =
  if greater l h
  then []
  else case increment l of
    Nothing -> [l]
    Just x -> add [l] (range x h)

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one

sequence :: forall a b c. (Apply b, Map b, Pure b, Traverse a) => a (b c) -> b (a c)
sequence = traverse identity

sign :: forall a. (Greater a, Less a, One a, Subtract a, Zero a) => a -> a
sign x =
  if less x zero
  then -one
  else if greater x zero
  then one
  else zero

size :: forall a b. (Reduce a) => a b -> Int
size = reduce (\ a _ -> add a 1) 0

sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum = reduce add zero

swap :: forall a b. Pair a b -> Pair b a
swap (Pair x) = pair x.second x.first

uncurry :: forall a b c. (a -> b -> c) -> (Pair a b -> c)
uncurry f = \ (Pair x) -> f x.first x.second

unsafeFromJust :: forall a. Maybe a -> a
unsafeFromJust x = case x of
  Nothing -> unsafeRunEffect (throw (exception "unsafeFromJust"))
  Just j -> j

unsafeLog :: forall a. String -> a -> a
unsafeLog message value = unsafeRunEffect
  (do
    log message
    pure value)

withDefault :: forall a. a -> Maybe a -> a
withDefault = maybe identity
