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

-- | Returns the absolute value of a number.
-- |
-- | Examples:
-- | ``` purescript
-- | absoluteValue (-2) -- 2
-- | absoluteValue 3 -- 3
-- | ```
absoluteValue :: forall a. (Less a, Subtract a, Zero a) => a -> a
absoluteValue x = if less zero x then negate x else x

-- | Returns true if all of the elements in the collection pass the predicate.
-- |
-- | Examples:
-- | ``` purescript
-- | all (> 1) [2, 3] -- true
-- | all (> 1) [2, 1] -- false
-- | ```
all :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = reduce (\ a x -> and a (p x)) true xs

-- | Returns true if any of the elements in the collection pass the predicate.
-- |
-- | Examples:
-- | ``` purescript
-- | any (> 1) [1, 2] -- true
-- | any (> 1) [1, 0] -- false
-- | ```
any :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = reduce (\ a x -> or a (p x)) false xs

-- | A type-restricted version of `always`.
-- |
-- | Examples:
-- | ``` purescript
-- | asTypeOf [1] [] -- [] :: Array Int
-- | ```
asTypeOf :: forall a. a -> a -> a
asTypeOf y x = always x y

-- TODO: Move to Neon.Syntax.
bind :: forall a b c. (Chain a) => a b -> (b -> a c) -> a c
bind x f = chain f x

-- | Clamps a value between some bounds. If the lower bound is greater than the
-- | upper bound, they will be swapped.
-- |
-- | Examples:
-- | ``` purescript
-- | clamp 3 5 2 -- 3
-- | clamp 3 5 4 -- 4
-- | clamp 3 5 6 -- 5
-- | clamp 5 3 6 -- 5
-- | ```
clamp :: forall a. (Greater a, Less a) => a -> a -> a -> a
clamp l h x =
  if greater h l
  then clamp h l x
  else max l (min h x)

-- | Returns true if the container contains the element.
-- |
-- | Examples:
-- | ``` purescript
-- | contains 2 [1, 2, 3] -- true
-- | contains 2 [1, 0, 3] -- false
-- | ```
contains :: forall a b. (Equal b, Reduce a) => b -> a b -> Boolean
contains x xs = any (equal x) xs

-- | Converts a function that operates on tuples to a normal function.
-- |
-- | Examples:
-- | ``` purescript
-- | let f (Tuple x y) = x + y
-- | curry f "a" "b" -- "ab"
-- | ```
curry :: forall a b c. (Tuple a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (Tuple x y)

-- | Decreases a value by one. If the value is already the bottom, nothing will
-- | be returned.
-- |
-- | Examples:
-- | ``` purescript
-- | decrement 'b' -- Just 'a'
-- | decrement '\0' -- Nothing
-- | ```
decrement :: forall a. (FromInt a, ToInt a) => a -> Maybe a
decrement x = fromInt (subtract 1 (toInt x))

-- | Returns true if the number is divisible by the other.
-- |
-- | Examples:
-- | ``` purescript
-- | divisibleBy 3 9 -- true
-- | divisibleBy 3 8 -- false
-- | ```
divisibleBy :: forall a. (Equal a, Remainder a, Zero a) => a -> a -> Boolean
divisibleBy y x = equal zero (remainder y x)

-- | Creates an array that ranges from the given upper bound down to the lower
-- | bound.
-- |
-- | Examples:
-- | ``` purescript
-- | downTo 1 3 -- [3, 2, 1]
-- | downTo 1 1 -- [1]
-- | downTo 3 1 -- []
-- | ```
downTo :: forall a. (FromInt a, Less a, ToInt a) => a -> a -> Array a
downTo l h =
  let downToList :: a -> a -> List a
      downToList b t = if less b t
        then Nil
        else case decrement t of
          Nothing -> Cons t Nil
          Just x -> Cons t (downToList b x)
  in  toArray (downToList l h)

-- | Returns true if the container is empty.
-- |
-- | Examples:
-- | ``` purescript
-- | empty [] -- true
-- | empty [1] -- false
-- | ```
empty :: forall a b. (Reduce a) => a b -> Boolean
empty xs = all (always false) xs

-- | Returns true if the number is even.
-- |
-- | Examples:
-- | ``` purescript
-- | even 2 -- true
-- | even 3 -- false
-- | ```
even :: Int -> Boolean
even x = divisibleBy 2 x

-- | Removes a level of nesting from a container.
-- |
-- | Examples:
-- | ``` purescript
-- | flatten [[1, 2], [3, 4]] -- [1, 2, 3, 4]
-- | ```
flatten :: forall a b. (Chain a) => a (a b) -> a b
flatten xss = chain identity xss

-- | Returns true if the value is greater than or equal to the other.
-- |
-- | Examples:
-- | ``` purescript
-- | greaterOrEqual 1 2 -- true
-- | greaterOrEqual 2 2 -- true
-- | greaterOrEqual 3 2 -- false
-- | ```
greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual y x = or (greater y x) (equal y x)

-- | Increases a value by one. If the value is already the top, nothing will be
-- | returned.
-- |
-- | Examples:
-- | ``` purescript
-- | increment 'a' -- Just 'b'
-- | increment '\65535' -- Nothing
-- | ```
increment :: forall a. (FromInt a, ToInt a) => a -> Maybe a
increment x = fromInt (add 1 (toInt x))

-- | Returns true if the number is infinite.
-- |
-- | Examples:
-- | ``` purescript
-- | infinite infinity -- true
-- | infinite (-infinity) -- true
-- | infinite nan -- true
-- | infinite 1.2 -- false
-- | ```
infinite :: Number -> Boolean
infinite x = not (finite x)

-- | Returns true if the value is less than or equal to the other.
-- |
-- | Examples:
-- | ``` purescript
-- | lessOrEqual 1 2 -- false
-- | lessOrEqual 2 2 -- true
-- | lessOrEqual 3 2 -- true
-- | ```
lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual y x = or (less y x) (equal y x)

-- | Returns the greater value.
-- |
-- | Examples:
-- | ``` purescript
-- | max 1 2 -- 2
-- | max 2 1 -- 2
-- | ```
max :: forall a. (Greater a) => a -> a -> a
max y x = if greater y x then x else y

-- | Returns the greatest value.
-- |
-- | Examples:
-- | ``` purescript
-- | maximum [1, 3, 2] -- Just 3
-- | maximum [] -- Nothing
-- | ```
maximum :: forall a b. (Greater b, Reduce a) => a b -> Maybe b
maximum xs = reduce
  (\ a x -> case a of
    Nothing -> Just x
    Just y -> Just (max y x))
  Nothing
  xs

-- | Returns the lesser value.
-- |
-- | Examples:
-- | ``` purescript
-- | min 1 2 -- 1
-- | min 2 1 -- 1
-- | ```
min :: forall a. (Less a) => a -> a -> a
min y x = if less y x then x else y

-- | Returns the least value.
-- |
-- | Examples:
-- | ``` purescript
-- | minimum [2, 1, 3] -- Just 1
-- | minimum [] -- Nothing
-- | ```
minimum :: forall a b. (Less b, Reduce a) => a b -> Maybe b
minimum xs = reduce
  (\ a x -> case a of
    Nothing -> Just x
    Just y -> Just (min y x))
  Nothing
  xs

-- | Negates the value by subtracting the value from zero.
-- |
-- | Examples:
-- | ``` purescript
-- | negate 2 -- -2
-- | ```
negate :: forall a. (Subtract a, Zero a) => a -> a
negate x = subtract x zero

-- | Returns true if the value is not equal to the other.
-- |
-- | Examples:
-- | ``` purescript
-- | notEqual 1 2 -- true
-- | notEqual 1 1 -- true
-- | ```
notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual y x = not (equal y x)

-- | Returns true if the number is odd.
-- |
-- | Examples:
-- | ``` purescript
-- | odd 3 -- true
-- | odd 4 -- false
-- | ```
odd :: Int -> Boolean
odd x = not (even x)

-- | Shows a value and logs it.
-- |
-- | Examples:
-- | ``` purescript
-- | print 123 -- (prints "123")
-- | ```
print :: forall a b. (Show a) => a -> Eff (console :: CONSOLE | b) Unit
print x = log (show x)

-- | Multiplies all of the elements of a container together.
-- |
-- | Examples:
-- | ``` purescript
-- | product [2, 3] -- 6
-- | product [] -- 1
-- | ```
product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product xs = reduce multiply one xs

-- | Returns the reciprocal of the value by dividing one by it.
-- |
-- | Examples:
-- | ``` purescript
-- | reciprocal 2 -- 0.5
-- | ```
reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal x = divide x one

-- | Sequences actions and collects the results.
-- |
-- | Examples:
-- | ``` purescript
-- | sequence [Just 1, Just 2] ?= Just [1, 2]
-- | ```
sequence :: forall a b c. (Apply b, Map b, Traverse a, Wrap b) => a (b c) -> b (a c)
sequence xs = traverse identity xs

-- | Returns the sign of a number.
-- |
-- | Examples:
-- | ``` purescript
-- | sign 2 -- 1
-- | sign 0 -- 0
-- | sign (-2) -- -1
-- | ```
sign :: forall a. (Greater a, Less a, One a, Subtract a, Zero a) => a -> a
sign x =
  if less zero x
  then negate one
  else if greater zero x
  then one
  else zero

-- | Returns the size of a container.
-- |
-- | Examples:
-- | ``` purescript
-- | size [2, 3, 5] -- 3
-- | size [] -- 0
-- | ```
size :: forall a b. (Reduce a) => a b -> Int
size xs = reduce (\ a _ -> add 1 a) 0 xs

-- | Adds all the elements of a container together.
-- |
-- | Examples:
-- | ``` purescript
-- | sum [1, 2, 3] -- 6
-- | sum [] -- 0
-- | ```
sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum xs = reduce (\ a x -> add x a) zero xs

-- | Swaps the values in a tuple.
-- |
-- | Examples:
-- | ``` purescript
-- | swap (Tuple 1 'a') -- Tuple 'a' 1
-- | ```
swap :: forall a b. Tuple a b -> Tuple b a
swap (Tuple x y) = Tuple y x

-- | A wildly unsafe function that can be used to stand in for any value.
-- |
-- | Examples:
-- | ``` purescript
-- | todo :: Unit -- unit
-- | todo :: Boolean -- (?)
-- | ```
todo :: forall a. a
todo = unsafeCoerce unit

-- | Converts a regular function into one that takes a tuple.
-- |
-- | Examples:
-- | ``` purescript
-- | let f x y = x + y
-- | uncurry f (Tuple "a" "b") -- "ab"
-- | ```
uncurry :: forall a b c. (a -> b -> c) -> (Tuple a b -> c)
uncurry f = \ (Tuple x y) -> f x y

-- | A wildly unsafe function that can convince the type system that any value
-- | is any type. Use this carefully!
-- |
-- | Examples:
-- | ``` purescript
-- | unsafeCoerce 1 :: Number -- 1.0
-- | unsafeCoerce 'a' :: String -- "a"
-- | ```
unsafeCoerce :: forall a b. a -> b
unsafeCoerce x = Coerce.unsafeCoerce x

-- | Unsafely write a string to the console.
-- |
-- | Examples:
-- | ``` purescript
-- | unsafeLog "unsafe!" unit -- unit (prints "unsafe!")
-- | ```
unsafeLog :: forall a. String -> a -> a
unsafeLog m x = unsafePerformEff do
  log m
  wrap x

-- | Creates an array that ranges from the given lower bound down to the upper
-- | bound.
-- |
-- | Examples:
-- | ``` purescript
-- | upTo 3 1 -- [1, 2, 3]
-- | upTo 1 1 -- [1]
-- | upTo 1 3 -- []
-- | ```
upTo :: forall a. (FromInt a, Greater a, ToInt a) => a -> a -> Array a
upTo h l =
  let upToList :: a -> a -> List a
      upToList t b = if greater t b
        then Nil
        else case increment b of
          Nothing -> Cons b Nil
          Just x -> Cons b (upToList t x)
  in  toArray (upToList h l)

-- | Replaces all values in the input container with `unit`. This is mostly
-- | useful for ignoring the value from an effect.
-- |
-- | Examples:
-- | ``` purescript
-- | void [1, 2] -- [unit, unit]
-- | ```
void :: forall a b. (Map a) => a b -> a Unit
void x = map (always unit) x

-- | If the predicate is true, run the effect. Otherwise run an effect that
-- | does nothing.
-- |
-- | Examples:
-- | ``` purescript
-- | when true [unit, unit] -- [unit, unit]
-- | when false [unit, unit] -- [unit]
-- | ```
when :: forall a. (Wrap a) => Boolean -> a Unit -> a Unit
when p x = if p then x else wrap unit

-- | Keeps calling the function while the predicate is true.
-- |
-- | Examples:
-- | ``` purescript
-- | while (< 3) (+ 1) 1 -- 3
-- | while (< 3) (+ 1) 9 -- 9
-- | ```
while :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

-- | If the given value is `Nothing`, return the default. Otherwise return the
-- | value.
-- |
-- | Examples:
-- | ``` purescript
-- | withDefault 2 Nothing -- 2
-- | withDefault 2 (Just 1) -- 1
-- | ```
withDefault :: forall a. a -> Maybe a -> a
withDefault y mx = case mx of
  Nothing -> y
  Just x -> x
