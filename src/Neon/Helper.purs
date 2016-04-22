module Neon.Helper where

import Neon.Class as Class
import Neon.Data as Data
import Neon.Effect as Effect
import Neon.Primitive as Primitive
import Unsafe.Coerce as Coerce

absoluteValue :: forall a. (Class.Less a, Class.Subtract a, Class.Zero a) => a -> a
absoluteValue x = if Class.less Class.zero x then negate x else x

all :: forall a b. (Class.Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = Class.reduce (\ a x -> Class.and a (p x)) true xs

any :: forall a b. (Class.Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = Class.reduce (\ a x -> Class.or a (p x)) false xs

asTypeOf :: forall a. a -> a -> a
asTypeOf y x = Primitive.always x y

bind :: forall a b c. (Class.HasChain a) => a b -> (b -> a c) -> a c
bind x f = Class.chain f x

clamp :: forall a. (Class.HasGreater a, Class.Less a) => a -> a -> a -> a
clamp b t x =
  if Class.greater t b
  then clamp t b x
  else max b (min t x)

concat :: forall a b. (Class.HasAdd b, Class.Reduce a, Class.Zero b) => a b -> b
concat xs = Class.reduce Class.add Class.zero xs

contains :: forall a b. (Class.HasEqual b, Class.Reduce a) => b -> a b -> Boolean
contains x xs = any (Class.equal x) xs

curry :: forall a b c. (Data.Tuple a b -> c) -> (a -> b -> c)
curry f = \ x y -> f (Data.Tuple x y)

decrement :: forall a. (Class.HasFromInt a, Class.ToInt a) => a -> Data.Maybe a
decrement x = Class.fromInt (Class.subtract 1 (Class.toInt x))

divisibleBy :: forall a. (Class.HasEqual a, Class.Remainder a, Class.Zero a) => a -> a -> Boolean
divisibleBy y x = Class.equal Class.zero (Class.remainder y x)

downTo :: forall a. (Class.HasFromInt a, Class.Less a, Class.ToInt a) => a -> a -> Array a
downTo l h =
  let downToList :: a -> a -> Data.List a
      downToList b t = if Class.less b t
        then Data.Nil
        else case decrement t of
          Data.Nothing -> Data.Cons t Data.Nil
          Data.Just x -> Data.Cons t (downToList b x)
  in  Class.toArray (downToList l h)

empty :: forall a b. (Class.Reduce a) => a b -> Boolean
empty xs = all (Primitive.always false) xs

even :: Int -> Boolean
even x = divisibleBy 2 x

flatten :: forall a b. (Class.HasChain a) => a (a b) -> a b
flatten xss = Class.chain Primitive.identity xss

greaterOrEqual :: forall a. (Class.HasEqual a, Class.HasGreater a) => a -> a -> Boolean
greaterOrEqual y x = Class.or (Class.equal y x) (Class.greater y x)

increment :: forall a. (Class.HasFromInt a, Class.ToInt a) => a -> Data.Maybe a
increment x = Class.fromInt (Class.add 1 (Class.toInt x))

infinite :: Number -> Boolean
infinite x = Class.not (Primitive.finite x)

lessOrEqual :: forall a. (Class.HasEqual a, Class.Less a) => a -> a -> Boolean
lessOrEqual y x = Class.or (Class.equal y x) (Class.less y x)

max :: forall a. (Class.HasGreater a) => a -> a -> a
max y x = if Class.greater y x then x else y

maximum :: forall a b. (Class.HasGreater b, Class.Reduce a) => a b -> Data.Maybe b
maximum xs = Class.reduce
  (\ a x -> case a of
    Data.Nothing -> Data.Just x
    Data.Just y -> Data.Just (max y x))
  Data.Nothing
  xs

min :: forall a. (Class.Less a) => a -> a -> a
min y x = if Class.less y x then x else y

minimum :: forall a b. (Class.Less b, Class.Reduce a) => a b -> Data.Maybe b
minimum xs = Class.reduce
  (\ a x -> case a of
    Data.Nothing -> Data.Just x
    Data.Just y -> Data.Just (min y x))
  Data.Nothing
  xs

negate :: forall a. (Class.Subtract a, Class.Zero a) => a -> a
negate x = Class.subtract x Class.zero

notANumber :: Number -> Boolean
notANumber x = Class.not (Primitive.aNumber x)

notEqual :: forall a. (Class.HasEqual a) => a -> a -> Boolean
notEqual y x = Class.not (Class.equal y x)

odd :: Int -> Boolean
odd x = Class.not (even x)

print :: forall a b. (Class.HasInspect a) => a -> Effect.Eff (console :: Effect.CONSOLE | b) Data.Unit
print x = Effect.log (Class.inspect x)

product :: forall a b. (Class.Multiply b, Class.One b, Class.Reduce a) => a b -> b
product xs = Class.reduce Class.multiply Class.one xs

reciprocal :: forall a. (Class.HasDivide a, Class.One a) => a -> a
reciprocal x = Class.divide x Class.one

sequence :: forall a b c. (Class.HasApply b, Class.Map b, Class.Traverse a, Class.Pure b) => a (b c) -> b (a c)
sequence xs = Class.traverse Primitive.identity xs

sign :: forall a. (Class.HasGreater a, Class.Less a, Class.One a, Class.Subtract a, Class.Zero a) => a -> a
sign x =
  if Class.less Class.zero x
  then negate Class.one
  else if Class.greater Class.zero x
  then Class.one
  else Class.zero

size :: forall a b. (Class.Reduce a) => a b -> Int
size xs = Class.reduce (\ a _ -> Class.add 1 a) 0 xs

sum :: forall a b. (Class.HasAdd b, Class.Reduce a, Class.Zero b) => a b -> b
sum xs = Class.reduce (\ a x -> Class.add x a) Class.zero xs

swap :: forall a b. Data.Tuple a b -> Data.Tuple b a
swap (Data.Tuple x y) = Data.Tuple y x

todo :: forall a. a
todo = unsafeCoerce Data.unit

truncate :: Number -> Int
truncate x = if Class.greater 0.0 x
  then Primitive.floor x
  else Primitive.ceiling x

uncurry :: forall a b c. (a -> b -> c) -> (Data.Tuple a b -> c)
uncurry f = \ (Data.Tuple x y) -> f x y

unsafeCoerce :: forall a b. a -> b
unsafeCoerce x = Coerce.unsafeCoerce x

unsafeLog :: forall a. String -> a -> a
unsafeLog m x = Effect.unsafePerformEff do
  Effect.log m
  Class.pure x

upTo :: forall a. (Class.HasFromInt a, Class.HasGreater a, Class.ToInt a) => a -> a -> Array a
upTo h l =
  let upToList :: a -> a -> Data.List a
      upToList t b = if Class.greater t b
        then Data.Nil
        else case increment b of
          Data.Nothing -> Data.Cons b Data.Nil
          Data.Just x -> Data.Cons b (upToList t x)
  in  Class.toArray (upToList h l)

void :: forall a b. (Class.Map a) => a b -> a Data.Unit
void x = Class.map (Primitive.always Data.unit) x

when :: forall a. (Class.Pure a) => Boolean -> a Data.Unit -> a Data.Unit
when p x = if p then x else Class.pure Data.unit

while :: forall a. (a -> Boolean) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

withDefault :: forall a. a -> Data.Maybe a -> a
withDefault y mx = case mx of
  Data.Nothing -> y
  Data.Just x -> x
