module Neon.Helper
  ( absoluteValue
  , all
  , any
  , clamp
  , contains
  , decrement
  , for
  , greaterOrEqual
  , increment
  , isEmpty
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
  , sign
  , size
  , sum
  , withDefault
  , unsafeFromJust
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.And (And, and)
import Neon.Class.Always (always)
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
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.ToInt (ToInt, toInt)
import Neon.Class.Zero (Zero, zero)
import Neon.Data.Exception (exception)
import Neon.Data.Maybe (Maybe(Nothing, Just), maybe)
import Neon.Effect.Effect (unsafeRunEffect)
import Neon.Effect.Exception (throw)

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

decrement :: forall a. (FromInt a, ToInt a) => a -> Maybe a
decrement x = fromInt (subtract (toInt x) 1)

for :: forall a b c. (Map a) => a b -> (b -> c) -> a c
for = flip map

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual x = or (greater x) (equal x)

increment :: forall a. (FromInt a, ToInt a) => a -> Maybe a
increment x = fromInt (add (toInt x) 1)

isEmpty :: forall a b. (Reduce a) => a b -> Boolean
isEmpty = all (always false)

isJust :: forall a. Maybe a -> Boolean
isJust = maybe (always true) false

isNothing :: forall a. Maybe a -> Boolean
isNothing = not isJust

join :: forall a b. (Bind a) => a (a b) -> a b
join = flip bind identity

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual x = or (less x) (equal x)

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
notEqual = not equal

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

unsafeFromJust :: forall a. Maybe a -> a
unsafeFromJust x = case x of
  Nothing -> unsafeRunEffect (throw (exception "unsafeFromJust"))
  Just j -> j

withDefault :: forall a. a -> Maybe a -> a
withDefault = maybe identity
