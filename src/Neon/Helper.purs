module Neon.Helper
  ( absoluteValue
  , all
  , any
  , asTypeOf
  , bind
  , clamp
  , contains
  , curry
  , decrement
  , divisibleBy
  , downTo
  , empty
  , even
  , flatten
  , greaterOrEqual
  , increment
  , infinite
  , lessOrEqual
  , max
  , maximum
  , min
  , minimum
  , negate
  , notEqual
  , odd
  , print
  , product
  , reciprocal
  , sequence
  , sign
  , size
  , sum
  , swap
  , todo
  , uncurry
  , unsafeCoerce
  , unsafeLog
  , upTo
  , void
  , when
  , while
  , withDefault
  ) where

import Neon.Class.Add (Add, add)
import Neon.Class.And (and)
import Neon.Class.Apply (Apply)
import Neon.Class.Chain (Chain, chain)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.FromInt (FromInt, fromInt)
import Neon.Class.Greater (Greater, greater)
import Neon.Class.Less (Less, less)
import Neon.Class.Map (Map, map)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Or (or)
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Remainder (Remainder, remainder)
import Neon.Class.Show (Show, show)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.ToArray (toArray)
import Neon.Class.ToInt (ToInt, toInt)
import Neon.Class.Traverse (Traverse, traverse)
import Neon.Class.Wrap (Wrap, wrap)
import Neon.Class.Zero (Zero, zero)
import Neon.Data (List(Nil, Cons), Maybe(Nothing, Just), Tuple(Tuple), Unit(), unit)
import Neon.Effect (Eff(), CONSOLE(), log, unsafePerformEff)
import Neon.Primitive.Function (always, identity)
import Neon.Primitive.Number (finite)
import Unsafe.Coerce as Coerce

absoluteValue :: forall a. (Less a, Subtract a, Zero a) => a -> a
absoluteValue x = if less zero x then negate x else x

all :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = reduce (\ a x -> and a (p x)) true xs

any :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = reduce (\ a x -> or a (p x)) false xs

asTypeOf :: forall a. a -> a -> a
asTypeOf y x = always x y

bind :: forall a b c. (Chain a) => a b -> (b -> a c) -> a c
bind x f = chain f x

clamp :: forall a. (Greater a, Less a) => a -> a -> a -> a
clamp l h x =
  if greater h l
  then clamp h l x
  else max l (min h x)

contains :: forall a b. (Equal b, Reduce a) => b -> a b -> Boolean
contains x xs = any (equal x) xs

curry :: forall a b c. (Tuple a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (Tuple x y)

decrement :: forall a. (FromInt a, ToInt a) => a -> Maybe a
decrement x = fromInt (subtract 1 (toInt x))

divisibleBy :: forall a. (Equal a, Remainder a, Zero a) => a -> a -> Boolean
divisibleBy y x = equal zero (remainder y x)

downTo :: forall a. (FromInt a, Less a, ToInt a) => a -> a -> Array a
downTo l h =
  let downToList :: a -> a -> List a
      downToList b t = if less b t
        then Nil
        else case decrement t of
          Nothing -> Cons t Nil
          Just x -> Cons t (downToList b x)
  in  toArray (downToList l h)

empty :: forall a b. (Reduce a) => a b -> Boolean
empty xs = all (always false) xs

even :: Int -> Boolean
even x = divisibleBy 2 x

flatten :: forall a b. (Chain a) => a (a b) -> a b
flatten xss = chain identity xss

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual y x = or (greater y x) (equal y x)

increment :: forall a. (FromInt a, ToInt a) => a -> Maybe a
increment x = fromInt (add 1 (toInt x))

infinite :: Number -> Boolean
infinite x = not (finite x)

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual y x = or (less y x) (equal y x)

max :: forall a. (Greater a) => a -> a -> a
max y x = if greater y x then x else y

maximum :: forall a b. (Greater b, Reduce a) => a b -> Maybe b
maximum xs = reduce
  (\ a x -> case a of
    Nothing -> Just x
    Just y -> Just (max y x))
  Nothing
  xs

min :: forall a. (Less a) => a -> a -> a
min y x = if less y x then x else y

minimum :: forall a b. (Less b, Reduce a) => a b -> Maybe b
minimum xs = reduce
  (\ a x -> case a of
    Nothing -> Just x
    Just y -> Just (min y x))
  Nothing
  xs

negate :: forall a. (Subtract a, Zero a) => a -> a
negate x = subtract x zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual y x = not (equal y x)

odd :: Int -> Boolean
odd x = not (even x)

print :: forall a b. (Show a) => a -> Eff (console :: CONSOLE | b) Unit
print x = log (show x)

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product xs = reduce multiply one xs

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal x = divide x one

sequence :: forall a b c. (Apply b, Map b, Traverse a, Wrap b) => a (b c) -> b (a c)
sequence xs = traverse identity xs

sign :: forall a. (Greater a, Less a, One a, Subtract a, Zero a) => a -> a
sign x =
  if less zero x
  then negate one
  else if greater zero x
  then one
  else zero

size :: forall a b. (Reduce a) => a b -> Int
size xs = reduce (\ a _ -> add 1 a) 0 xs

sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum xs = reduce (\ a x -> add x a) zero xs

swap :: forall a b. Tuple a b -> Tuple b a
swap (Tuple x y) = Tuple y x

todo :: forall a. a
todo = unsafeCoerce unit

uncurry :: forall a b c. (a -> b -> c) -> (Tuple a b -> c)
uncurry f = \ (Tuple x y) -> f x y

unsafeCoerce :: forall a b. a -> b
unsafeCoerce x = Coerce.unsafeCoerce x

unsafeLog :: forall a. String -> a -> a
unsafeLog m x = unsafePerformEff do
  log m
  wrap x

upTo :: forall a. (FromInt a, Greater a, ToInt a) => a -> a -> Array a
upTo h l =
  let upToList :: a -> a -> List a
      upToList t b = if greater t b
        then Nil
        else case increment b of
          Nothing -> Cons b Nil
          Just x -> Cons b (upToList t x)
  in  toArray (upToList h l)

void :: forall a b. (Map a) => a b -> a Unit
void x = map (always unit) x

when :: forall a. (Wrap a) => Boolean -> a Unit -> a Unit
when p x = if p then x else wrap unit

while :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

withDefault :: forall a. a -> Maybe a -> a
withDefault y mx = case mx of
  Nothing -> y
  Just x -> x
