module Neon.Helper
  ( absoluteValue
  , all
  , any
  , asTypeOf
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
  , print
  , product
  , range
  , reciprocal
  , sequence
  , sign
  , size
  , sum
  , swap
  , uncurry
  , unless
  , unsafeFromJust
  , unsafeLog
  , until
  , void
  , when
  , while
  , withDefault
  ) where

import Neon.Class.Add (class Add, add)
import Neon.Class.And (and)
import Neon.Class.Always (always)
import Neon.Class.Apply (class Apply)
import Neon.Class.Bind (class Bind, bind)
import Neon.Class.Bottom (bottom)
import Neon.Class.Divide (class Divide, divide)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Flip (flip)
import Neon.Class.FromInt (class FromInt, fromInt)
import Neon.Class.Greater (class Greater, greater)
import Neon.Class.Identity (identity)
import Neon.Class.Less (class Less, less)
import Neon.Class.Map (class Map, map)
import Neon.Class.Multiply (class Multiply, multiply)
import Neon.Class.Not (not)
import Neon.Class.One (class One, one)
import Neon.Class.Or (or)
import Neon.Class.Pure (class Pure, pure)
import Neon.Class.Traverse (class Traverse, traverse)
import Neon.Class.Reduce (class Reduce, reduce)
import Neon.Class.Show (class Show, show)
import Neon.Class.Subtract (class Subtract, subtract)
import Neon.Class.ToArray (toArray)
import Neon.Class.ToInt (class ToInt, toInt)
import Neon.Class.Zero (class Zero, zero)
import Neon.Data.Exception (exception)
import Neon.Data.List (List(Nil, Cons))
import Neon.Data.Maybe (Maybe(Nothing, Just), maybe)
import Neon.Data.Pair (Pair(Pair), pair)
import Neon.Data.Unit (Unit, unit)
import Neon.Effect.Console (CONSOLE, log)
import Neon.Effect.Effect (Effect, unsafeRunEffect)
import Neon.Effect.Exception (throw)
import Neon.Primitive.Number (isFinite)

absoluteValue :: forall a. (Less a, Subtract a, Zero a) => a -> a
absoluteValue x = if less x zero then negate x else x

all :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = reduce (\ a x -> and a (p x)) true xs

any :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = reduce (\ a x -> or a (p x)) bottom xs

asTypeOf :: forall a. a -> a -> a
asTypeOf = always

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

print :: forall a. (Show a) => a -> Effect (console :: CONSOLE) Unit
print x = log (show x)

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product = reduce multiply one

range :: forall a. (FromInt a, Greater a, ToInt a) => a -> a -> Array a
range l h = toArray (rangeList l h)

rangeList :: forall a. (FromInt a, Greater a, ToInt a) => a -> a -> List a
rangeList l h = if greater l h
  then Nil
  else case increment l of
    Nothing -> Cons l Nil
    Just x -> Cons l (rangeList x h)

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

unless :: forall a. (Pure a) => Boolean -> a Unit -> a Unit
unless p x = if p then pure unit else x

unsafeFromJust :: forall a. Maybe a -> a
unsafeFromJust x = case x of
  Nothing -> unsafeRunEffect (throw (exception "unsafeFromJust"))
  Just j -> j

unsafeLog :: forall a. String -> a -> a
unsafeLog message value = unsafeRunEffect
  (do
    log message
    pure value)

until :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
until p f x = if p x then x else until p f (f x)

void :: forall a b. (Map a) => a b -> a Unit
void x = map (always unit) x

when :: forall a. (Pure a) => Boolean -> a Unit -> a Unit
when p x = if p then x else pure unit

while :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

withDefault :: forall a. a -> Maybe a -> a
withDefault = maybe identity
