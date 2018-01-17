-- | Helper functions that are defined in terms of other primitives.
-- |
-- | Many of these should be type class members with default implementations.
-- | Unfortunately PureScript doesn't support that yet. They are defined in
-- | here to make adding type class instances as easy as possible. The downside
-- | is that things like `size` are O(n) when they could be O(1) for some
-- | container types.
module Neon.Helper where

import Control.Bind (discard)
import Neon.Class as Class
import Neon.Data as Data
import Neon.Effect as Effect
import Neon.Primitive as Primitive
import Unsafe.Coerce as Coerce

-- | Returns the absolute value of a number.
-- |
-- | ``` purescript
-- | absoluteValue (-2) -- 2
-- | absoluteValue 3 -- 3
-- | ```
absoluteValue :: forall a. Class.HasLess a => Class.HasSubtract a => Class.HasZero a => a -> a
absoluteValue x = if Class.less Class.zero x then negate x else x

-- | Returns true if all of the elements in the collection pass the predicate.
-- |
-- | ``` purescript
-- | [2, 3] :all (_ > 1) -- true
-- | [2, 1] :all (_ > 1) -- false
-- | ```
all :: forall a b. (Class.HasReduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = Class.reduce (\ a x -> Class.and a (p x)) true xs

-- | Returns true if any of the elements in the collection pass the predicate.
-- |
-- | ``` purescript
-- | [1, 2] :any (_ > 1) -- true
-- | [1, 0] :any (_ > 1) -- false
-- | ```
any :: forall a b. (Class.HasReduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = Class.reduce (\ a x -> Class.or a (p x)) false xs

-- | A type-restricted version of `always`.
-- |
-- | ``` purescript
-- | [] :asTypeOf [1] -- [] :: Array Int
-- | ```
asTypeOf :: forall a. a -> a -> a
asTypeOf y x = Primitive.always x y

-- | A version of `chain` with the arguments flipped. This is provided only to
-- | support desugaring `do` notation. It is not recommended to use explicitly.
bind :: forall a b c. (Class.HasChain a) => a b -> (b -> a c) -> a c
bind x f = Class.chain f x

-- | Clamps a value between some bounds. If the lower bound is greater than the
-- | upper bound, they will be swapped.
-- |
-- | ``` purescript
-- | 2 :clamp 3 5 -- 3
-- | 4 :clamp 3 5 -- 4
-- | 6 :clamp 3 5 -- 5
-- | 6 :clamp 5 3 -- 5
-- | ```
clamp :: forall a. Class.HasGreater a => Class.HasLess a => a -> a -> a -> a
clamp b t x =
  if Class.greater t b
  then clamp t b x
  else max b (min t x)

-- | Returns true if the container contains the element.
-- |
-- | ``` purescript
-- | [1, 2, 3] :contains 2 -- true
-- | [1, 0, 3] :contains 2 -- false
-- | ```
contains :: forall a b. Class.HasEqual b => Class.HasReduce a => b -> a b -> Boolean
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
decrement :: forall a. Class.HasFromInt a => Class.HasToInt a => a -> Data.Maybe a
decrement x = Class.fromInt (Class.subtract 1 (Class.toInt x))

-- | Returns true if the number is divisible by the other.
-- |
-- | ``` purescript
-- | 9 :divisibleBy 3 -- true
-- | 8 :divisibleBy 3 -- false
-- | ```
divisibleBy :: forall a. Class.HasEqual a => Class.HasRemainder a => Class.HasZero a => a -> a -> Boolean
divisibleBy y x = Class.equal Class.zero (Class.remainder y x)

-- | Creates an array that ranges from the given upper bound down to the lower
-- | bound.
-- |
-- | ``` purescript
-- | 3 :downTo 1 -- [3, 2, 1]
-- | 1 :downTo 1 -- [1]
-- | 1 :downTo 3 -- []
-- | ```
downTo :: forall a. Class.HasFromInt a => Class.HasLess a => Class.HasToInt a => a -> a -> Array a
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
empty :: forall a b. (Class.HasReduce a) => a b -> Boolean
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
flatten :: forall a b. (Class.HasChain a) => a (a b) -> a b
flatten xss = Class.chain Primitive.identity xss

-- | Returns true if the value is greater than or equal to the other.
-- |
-- | ``` purescript
-- | 2 :greaterOrEqual 1 -- true
-- | 2 :greaterOrEqual 2 -- true
-- | 2 :greaterOrEqual 3 -- false
-- | ```
greaterOrEqual :: forall a. Class.HasEqual a => Class.HasGreater a => a -> a -> Boolean
greaterOrEqual y x = Class.or (Class.equal y x) (Class.greater y x)

-- | Increases a value by one. If the value is already the top, nothing will be
-- | returned.
-- |
-- | ``` purescript
-- | increment 'a' -- Just 'b'
-- | increment '\65535' -- Nothing
-- | ```
increment :: forall a. Class.HasFromInt a => Class.HasToInt a => a -> Data.Maybe a
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
-- | 2 :lessOrEqual 1 -- false
-- | 2 :lessOrEqual 2 -- true
-- | 2 :lessOrEqual 3 -- true
-- | ```
lessOrEqual :: forall a. Class.HasEqual a => Class.HasLess a => a -> a -> Boolean
lessOrEqual y x = Class.or (Class.equal y x) (Class.less y x)

-- | Returns the greater value.
-- |
-- | ``` purescript
-- | max 1 2 -- 2
-- | max 2 1 -- 2
-- | ```
max :: forall a. (Class.HasGreater a) => a -> a -> a
max y x = if Class.greater y x then x else y

-- | Returns the greatest value.
-- |
-- | ``` purescript
-- | maximum [1, 3, 2] -- Just 3
-- | maximum [] -- Nothing
-- | ```
maximum :: forall a b. Class.HasGreater b => Class.HasReduce a => a b -> Data.Maybe b
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
min :: forall a. (Class.HasLess a) => a -> a -> a
min y x = if Class.less y x then x else y

-- | Returns the least value.
-- |
-- | ``` purescript
-- | minimum [2, 1, 3] -- Just 1
-- | minimum [] -- Nothing
-- | ```
minimum :: forall a b. Class.HasLess b => Class.HasReduce a => a b -> Data.Maybe b
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
negate :: forall a. Class.HasSubtract a => Class.HasZero a => a -> a
negate x = Class.subtract x Class.zero

-- | Returns `true` if the number is not a valid number. This is useful to test
-- | for `nan`.
-- |
-- | ``` purescript
-- | notANumber 1 -- false
-- | notANumber infinity -- false
-- | notANumber nan -- true
-- | ```
notANumber :: Number -> Boolean
notANumber x = Class.not (Primitive.aNumber x)

-- | Returns true if the value is not equal to the other.
-- |
-- | ``` purescript
-- | 2 :notEqual 1 -- true
-- | 1 :notEqual 1 -- true
-- | ```
notEqual :: forall a. (Class.HasEqual a) => a -> a -> Boolean
notEqual y x = Class.not (Class.equal y x)

-- | Returns true if the number is odd.
-- |
-- | ``` purescript
-- | odd 3 -- true
-- | odd 4 -- false
-- | ```
odd :: Int -> Boolean
odd x = Class.not (even x)

-- | Inspects a value and logs it.
-- |
-- | ``` purescript
-- | print 123 -- (logs "123")
-- | ```
print :: forall a b. (Class.HasInspect a) => a -> Effect.Eff (console :: Effect.CONSOLE | b) Data.Unit
print x = Effect.log (Class.inspect x)

-- | Multiplies all of the elements of a container together.
-- |
-- | ``` purescript
-- | product [2, 3] -- 6
-- | product [] -- 1
-- | ```
product :: forall a b. Class.HasMultiply b => Class.HasOne b => Class.HasReduce a => a b -> b
product xs = Class.reduce Class.multiply Class.one xs

-- | Returns the reciprocal of the value by dividing one by it.
-- |
-- | ``` purescript
-- | reciprocal 2 -- 0.5
-- | ```
reciprocal :: forall a. Class.HasDivide a => Class.HasOne a => a -> a
reciprocal x = Class.divide x Class.one

-- | Sequences actions and collects the results.
-- |
-- | ``` purescript
-- | sequence [Just 1, Just 2] -- Just [1, 2]
-- | ```
sequence :: forall a b c. Class.HasApply b => Class.HasMap b => Class.HasTraverse a => Class.HasPure b => a (b c) -> b (a c)
sequence xs = Class.traverse Primitive.identity xs

-- | Returns the sign of a number.
-- |
-- | ``` purescript
-- | sign 2 -- 1
-- | sign 0 -- 0
-- | sign (-2) -- -1
-- | ```
sign :: forall a. Class.HasGreater a => Class.HasLess a => Class.HasOne a => Class.HasSubtract a => Class.HasZero a => a -> a
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
size :: forall a b. (Class.HasReduce a) => a b -> Int
size xs = Class.reduce (\ a _ -> Class.add 1 a) 0 xs

-- | Adds all the elements of a container together. If the container is empty,
-- | returns `zero`.
-- |
-- | ``` purescript
-- | [1, 2, 3] :sum -- 6
-- | ([] :: Array Int) :sum -- 0
-- | ["ab", "cd", "ef"] :sum -- "abcdef"
-- | ([] :: Array String) :sum -- ""
-- | ```
sum :: forall a b. Class.HasAdd b => Class.HasReduce a => Class.HasZero b => a b -> b
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
-- | todo :: Boolean -- ?
-- | ```
-- |
-- | This should never end up in production, but it can be useful when
-- | developing a function.
todo :: forall a. a
todo = unsafeCoerce Data.unit

-- | Removes the decimal part of a number and returns an integer.
-- |
-- | ``` purescript
-- | truncate 1.0 -- 1
-- | truncate 1.9 -- 1
-- | truncate (-1.9) -- -1
-- | ```
truncate :: Number -> Int
truncate x = if Class.greater 0.0 x
  then Primitive.floor x
  else Primitive.ceiling x

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
-- | unsafeLog "unsafe!" unit -- unit (logs "unsafe!")
-- | ```
unsafeLog :: forall a. String -> a -> a
unsafeLog m x = Effect.unsafePerformEff do
  Effect.log m
  Class.pure x

-- | Creates an array that ranges from the given lower bound down to the upper
-- | bound.
-- |
-- | ``` purescript
-- | 1 :upTo 3 -- [1, 2, 3]
-- | 1 :upTo 1 -- [1]
-- | 3 :upTo 1 -- []
-- | ```
upTo :: forall a. Class.HasFromInt a => Class.HasGreater a => Class.HasToInt a => a -> a -> Array a
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
void :: forall a b. (Class.HasMap a) => a b -> a Data.Unit
void x = Class.map (Primitive.always Data.unit) x

-- | If the predicate is true, run the effect. Otherwise run an effect that
-- | does nothing.
-- |
-- | ``` purescript
-- | when true [unit, unit] -- [unit, unit]
-- | when false [unit, unit] -- [unit]
-- | ```
when :: forall a. (Class.HasPure a) => Boolean -> a Data.Unit -> a Data.Unit
when p x = if p then x else Class.pure Data.unit

-- | Keeps calling the function while the predicate is true.
-- |
-- | ``` purescript
-- | 1 :while (_ < 3) (_ + 1) -- 3
-- | 9 :while (_ < 3) (_ + 1) -- 9
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
