module Neon.Helper where

import Neon.Class as Class
import Neon.Data as Data
import Neon.Effect as Effect
import Neon.Primitive as Primitive
-- import Prelude (bind)
import Unsafe.Coerce as Coerce

-- | Returns the absolute value of a number.
-- |
-- | ``` purescript
-- | absoluteValue (-2) -- 2
-- | absoluteValue 3 -- 3
-- | ```
absoluteValue :: forall a. (Class.Less a, Class.Subtract a, Class.Zero a) => a -> a
absoluteValue x = if Class.less Class.zero x then negate x else x

-- | Returns true if all of the elements in the collection pass the predicate.
-- |
-- | ``` purescript
-- | all (> 1) [2, 3] -- true
-- | all (> 1) [2, 1] -- false
-- | ```
all :: forall a b. (Class.Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = Class.reduce (\ a x -> Class.and a (p x)) true xs

-- | Returns true if any of the elements in the collection pass the predicate.
-- |
-- | ``` purescript
-- | any (> 1) [1, 2] -- true
-- | any (> 1) [1, 0] -- false
-- | ```
any :: forall a b. (Class.Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = Class.reduce (\ a x -> Class.or a (p x)) false xs

-- | A type-restricted version of `always`.
-- |
-- | ``` purescript
-- | asTypeOf [1] [] -- [] :: Array Int
-- | ```
asTypeOf :: forall a. a -> a -> a
asTypeOf y x = Primitive.always x y

bind :: forall a b c. (Class.Chain a) => a b -> (b -> a c) -> a c
bind x f = Class.chain f x

-- | Clamps a value between some bounds. If the lower bound is greater than the
-- | upper bound, they will be swapped.
-- |
-- | ``` purescript
-- | clamp 3 5 2 -- 3
-- | clamp 3 5 4 -- 4
-- | clamp 3 5 6 -- 5
-- | clamp 5 3 6 -- 5
-- | ```
clamp :: forall a. (Class.Greater a, Class.Less a) => a -> a -> a -> a
clamp l h x =
  if Class.greater h l
  then clamp h l x
  else max l (min h x)

-- | Returns true if the container contains the element.
-- |
-- | ``` purescript
-- | contains 2 [1, 2, 3] -- true
-- | contains 2 [1, 0, 3] -- false
-- | ```
contains :: forall a b. (Class.Equal b, Class.Reduce a) => b -> a b -> Boolean
contains x xs = any (Class.equal x) xs

-- | Converts a function that operates on tuples to a normal function.
-- |
-- | ``` purescript
-- | let f (Tuple x y) = x + y
-- | curry f "a" "b" -- "ab"
-- | ```
curry :: forall a b c. (Data.Tuple a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (Data.Tuple x y)

-- | Decreases a value by one. If the value is already the bottom, nothing will
-- | be returned.
-- |
-- | ``` purescript
-- | decrement 'b' -- Just 'a'
-- | decrement '\0' -- Nothing
-- | ```
decrement :: forall a. (Class.FromInt a, Class.ToInt a) => a -> Data.Maybe a
decrement x = Class.fromInt (Class.subtract 1 (Class.toInt x))

-- | Returns true if the number is divisible by the other.
-- |
-- | ``` purescript
-- | divisibleBy 3 9 -- true
-- | divisibleBy 3 8 -- false
-- | ```
divisibleBy :: forall a. (Class.Equal a, Class.Remainder a, Class.Zero a) => a -> a -> Boolean
divisibleBy y x = Class.equal Class.zero (Class.remainder y x)

-- | Creates an array that ranges from the given upper bound down to the lower
-- | bound.
-- |
-- | ``` purescript
-- | downTo 1 3 -- [3, 2, 1]
-- | downTo 1 1 -- [1]
-- | downTo 3 1 -- []
-- | ```
downTo :: forall a. (Class.FromInt a, Class.Less a, Class.ToInt a) => a -> a -> Array a
downTo l h =
  let downToList :: a -> a -> Data.List a
      downToList b t = if Class.less b t
        then Data.Nil
        else case decrement t of
          Data.Nothing -> Data.Cons t Data.Nil
          Data.Just x -> Data.Cons t (downToList b x)
  in  Class.toArray (downToList l h)

-- | Returns true if the container is empty.
-- |
-- | ``` purescript
-- | empty [] -- true
-- | empty [1] -- false
-- | ```
empty :: forall a b. (Class.Reduce a) => a b -> Boolean
empty xs = all (Primitive.always false) xs

-- | Returns true if the number is even.
-- |
-- | ``` purescript
-- | even 2 -- true
-- | even 3 -- false
-- | ```
even :: Int -> Boolean
even x = divisibleBy 2 x

-- | Removes a level of nesting from a container.
-- |
-- | ``` purescript
-- | flatten [[1, 2], [3, 4]] -- [1, 2, 3, 4]
-- | ```
flatten :: forall a b. (Class.Chain a) => a (a b) -> a b
flatten xss = Class.chain Primitive.identity xss

-- | Returns true if the value is greater than or equal to the other.
-- |
-- | ``` purescript
-- | greaterOrEqual 1 2 -- true
-- | greaterOrEqual 2 2 -- true
-- | greaterOrEqual 3 2 -- false
-- | ```
greaterOrEqual :: forall a. (Class.Equal a, Class.Greater a) => a -> a -> Boolean
greaterOrEqual y x = Class.or (Class.greater y x) (Class.equal y x)

-- | Increases a value by one. If the value is already the top, nothing will be
-- | returned.
-- |
-- | ``` purescript
-- | increment 'a' -- Just 'b'
-- | increment '\65535' -- Nothing
-- | ```
increment :: forall a. (Class.FromInt a, Class.ToInt a) => a -> Data.Maybe a
increment x = Class.fromInt (Class.add 1 (Class.toInt x))

-- | Returns true if the number is infinite.
-- |
-- | ``` purescript
-- | infinite infinity -- true
-- | infinite (-infinity) -- true
-- | infinite nan -- true
-- | infinite 1.2 -- false
-- | ```
infinite :: Number -> Boolean
infinite x = Class.not (Primitive.finite x)

-- | Returns true if the value is less than or equal to the other.
-- |
-- | ``` purescript
-- | lessOrEqual 1 2 -- false
-- | lessOrEqual 2 2 -- true
-- | lessOrEqual 3 2 -- true
-- | ```
lessOrEqual :: forall a. (Class.Equal a, Class.Less a) => a -> a -> Boolean
lessOrEqual y x = Class.or (Class.less y x) (Class.equal y x)

-- | Returns the greater value.
-- |
-- | ``` purescript
-- | max 1 2 -- 2
-- | max 2 1 -- 2
-- | ```
max :: forall a. (Class.Greater a) => a -> a -> a
max y x = if Class.greater y x then x else y

-- | Returns the greatest value.
-- |
-- | ``` purescript
-- | maximum [1, 3, 2] -- Just 3
-- | maximum [] -- Nothing
-- | ```
maximum :: forall a b. (Class.Greater b, Class.Reduce a) => a b -> Data.Maybe b
maximum xs = Class.reduce
  (\ a x -> case a of
    Data.Nothing -> Data.Just x
    Data.Just y -> Data.Just (max y x))
  Data.Nothing
  xs

-- | Returns the lesser value.
-- |
-- | ``` purescript
-- | min 1 2 -- 1
-- | min 2 1 -- 1
-- | ```
min :: forall a. (Class.Less a) => a -> a -> a
min y x = if Class.less y x then x else y

-- | Returns the least value.
-- |
-- | ``` purescript
-- | minimum [2, 1, 3] -- Just 1
-- | minimum [] -- Nothing
-- | ```
minimum :: forall a b. (Class.Less b, Class.Reduce a) => a b -> Data.Maybe b
minimum xs = Class.reduce
  (\ a x -> case a of
    Data.Nothing -> Data.Just x
    Data.Just y -> Data.Just (min y x))
  Data.Nothing
  xs

-- | Negates the value by subtracting the value from zero.
-- |
-- | ``` purescript
-- | negate 2 -- -2
-- | ```
negate :: forall a. (Class.Subtract a, Class.Zero a) => a -> a
negate x = Class.subtract x Class.zero

-- | Returns true if the value is not equal to the other.
-- |
-- | ``` purescript
-- | notEqual 1 2 -- true
-- | notEqual 1 1 -- true
-- | ```
notEqual :: forall a. (Class.Equal a) => a -> a -> Boolean
notEqual y x = Class.not (Class.equal y x)

-- | Returns true if the number is odd.
-- |
-- | ``` purescript
-- | odd 3 -- true
-- | odd 4 -- false
-- | ```
odd :: Int -> Boolean
odd x = Class.not (even x)

-- | Shows a value and logs it.
-- |
-- | ``` purescript
-- | print 123 -- (prints "123")
-- | ```
print :: forall a b. (Class.Show a) => a -> Effect.Eff (console :: Effect.CONSOLE | b) Data.Unit
print x = Effect.log (Class.show x)

-- | Multiplies all of the elements of a container together.
-- |
-- | ``` purescript
-- | product [2, 3] -- 6
-- | product [] -- 1
-- | ```
product :: forall a b. (Class.Multiply b, Class.One b, Class.Reduce a) => a b -> b
product xs = Class.reduce Class.multiply Class.one xs

-- | Returns the reciprocal of the value by dividing one by it.
-- |
-- | ``` purescript
-- | reciprocal 2 -- 0.5
-- | ```
reciprocal :: forall a. (Class.Divide a, Class.One a) => a -> a
reciprocal x = Class.divide x Class.one

-- | Sequences actions and collects the results.
-- |
-- | ``` purescript
-- | sequence [Just 1, Just 2] ?= Just [1, 2]
-- | ```
sequence :: forall a b c. (Class.Apply b, Class.Map b, Class.Traverse a, Class.Wrap b) => a (b c) -> b (a c)
sequence xs = Class.traverse Primitive.identity xs

-- | Returns the sign of a number.
-- |
-- | ``` purescript
-- | sign 2 -- 1
-- | sign 0 -- 0
-- | sign (-2) -- -1
-- | ```
sign :: forall a. (Class.Greater a, Class.Less a, Class.One a, Class.Subtract a, Class.Zero a) => a -> a
sign x =
  if Class.less Class.zero x
  then negate Class.one
  else if Class.greater Class.zero x
  then Class.one
  else Class.zero

-- | Returns the size of a container.
-- |
-- | ``` purescript
-- | size [2, 3, 5] -- 3
-- | size [] -- 0
-- | ```
size :: forall a b. (Class.Reduce a) => a b -> Int
size xs = Class.reduce (\ a _ -> Class.add 1 a) 0 xs

-- | Adds all the elements of a container together.
-- |
-- | ``` purescript
-- | sum [1, 2, 3] -- 6
-- | sum [] -- 0
-- | ```
sum :: forall a b. (Class.Add b, Class.Reduce a, Class.Zero b) => a b -> b
sum xs = Class.reduce (\ a x -> Class.add x a) Class.zero xs

-- | Swaps the values in a tuple.
-- |
-- | ``` purescript
-- | swap (Tuple 1 'a') -- Tuple 'a' 1
-- | ```
swap :: forall a b. Data.Tuple a b -> Data.Tuple b a
swap (Data.Tuple x y) = Data.Tuple y x

-- | A wildly unsafe function that can be used to stand in for any value.
-- |
-- | ``` purescript
-- | todo :: Unit -- unit
-- | todo :: Boolean -- (?)
-- | ```
todo :: forall a. a
todo = unsafeCoerce Data.unit

-- | Converts a regular function into one that takes a tuple.
-- |
-- | ``` purescript
-- | let f x y = x + y
-- | uncurry f (Tuple "a" "b") -- "ab"
-- | ```
uncurry :: forall a b c. (a -> b -> c) -> (Data.Tuple a b -> c)
uncurry f = \ (Data.Tuple x y) -> f x y

-- | A wildly unsafe function that can convince the type system that any value
-- | is any type. Use this carefully!
-- |
-- | ``` purescript
-- | unsafeCoerce 1 :: Number -- 1.0
-- | unsafeCoerce 'a' :: String -- "a"
-- | ```
unsafeCoerce :: forall a b. a -> b
unsafeCoerce x = Coerce.unsafeCoerce x

-- | Unsafely write a string to the console.
-- |
-- | ``` purescript
-- | unsafeLog "unsafe!" unit -- unit (prints "unsafe!")
-- | ```
unsafeLog :: forall a. String -> a -> a
unsafeLog m x = Effect.unsafePerformEff do
  Effect.log m
  Class.wrap x

-- | Creates an array that ranges from the given lower bound down to the upper
-- | bound.
-- |
-- | ``` purescript
-- | upTo 3 1 -- [1, 2, 3]
-- | upTo 1 1 -- [1]
-- | upTo 1 3 -- []
-- | ```
upTo :: forall a. (Class.FromInt a, Class.Greater a, Class.ToInt a) => a -> a -> Array a
upTo h l =
  let upToList :: a -> a -> Data.List a
      upToList t b = if Class.greater t b
        then Data.Nil
        else case increment b of
          Data.Nothing -> Data.Cons b Data.Nil
          Data.Just x -> Data.Cons b (upToList t x)
  in  Class.toArray (upToList h l)

-- | Replaces all values in the input container with `unit`. This is mostly
-- | useful for ignoring the value from an effect.
-- |
-- | ``` purescript
-- | void [1, 2] -- [unit, unit]
-- | ```
void :: forall a b. (Class.Map a) => a b -> a Data.Unit
void x = Class.map (Primitive.always Data.unit) x

-- | If the predicate is true, run the effect. Otherwise run an effect that
-- | does nothing.
-- |
-- | ``` purescript
-- | when true [unit, unit] -- [unit, unit]
-- | when false [unit, unit] -- [unit]
-- | ```
when :: forall a. (Class.Wrap a) => Boolean -> a Data.Unit -> a Data.Unit
when p x = if p then x else Class.wrap Data.unit

-- | Keeps calling the function while the predicate is true.
-- |
-- | ``` purescript
-- | while (< 3) (+ 1) 1 -- 3
-- | while (< 3) (+ 1) 9 -- 9
-- | ```
while :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

-- | If the given value is `Nothing`, return the default. Otherwise return the
-- | value.
-- |
-- | ``` purescript
-- | withDefault 2 Nothing -- 2
-- | withDefault 2 (Just 1) -- 1
-- | ```
withDefault :: forall a. a -> Data.Maybe a -> a
withDefault y mx = case mx of
  Data.Nothing -> y
  Data.Just x -> x
