module Neon.Helper where

import Neon.Class.Add (Add, add)
import Neon.Class.And (and)
import Neon.Class.Apply (Apply)
import Neon.Class.Chain (Chain, chain)
import Neon.Class.Divide (Divide, divide)
import Neon.Class.Equal (Equal, isEqual)
import Neon.Class.Greater (Greater, isGreater)
import Neon.Class.Less (Less, isLess)
import Neon.Class.Map (Map, map)
import Neon.Class.Multiply (Multiply, multiply)
import Neon.Class.Not (not)
import Neon.Class.One (One, one)
import Neon.Class.Or (or)
import Neon.Class.Reduce (Reduce, reduce)
import Neon.Class.Subtract (Subtract, subtract)
import Neon.Class.Traverse (Traverse, traverse)
import Neon.Class.Wrap (Wrap)
import Neon.Class.Zero (Zero, zero)
import Neon.Data (Unit(), unit)
import Neon.Primitive.Function (always, identity)
import Neon.Primitive.Number (isFinite)

absoluteValue :: forall a. (Less a, Subtract a, Zero a) => a -> a
absoluteValue x = if isLess zero x then negate x else x

all :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
all p xs = reduce (\ a x -> and a (p x)) true xs

any :: forall a b. (Reduce a) => (b -> Boolean) -> a b -> Boolean
any p xs = reduce (\ a x -> or a (p x)) false xs

asTypeOf :: forall a. a -> a -> a
asTypeOf y x = always x y

bind :: forall a b c. (Chain a) => a b -> (b -> a c) -> a c
bind x f = chain f x

flatten :: forall a b. (Chain a) => a (a b) -> a b
flatten xss = chain identity xss

isGreaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
isGreaterOrEqual y x = or (isGreater y x) (isEqual y x)

isInfinite :: Number -> Boolean
isInfinite x = not (isFinite x)

isLessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
isLessOrEqual y x = or (isLess y x) (isEqual y x)

isNotEqual :: forall a. (Equal a) => a -> a -> Boolean
isNotEqual y x = not (isEqual y x)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate x = subtract x zero

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal x = divide x one

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product xs = reduce multiply one xs

sequence :: forall a b c. (Apply b, Map b, Traverse a, Wrap b) => a (b c) -> b (a c)
sequence = traverse identity

sign :: forall a. (Greater a, Less a, One a, Subtract a, Zero a) => a -> a
sign x =
  if isLess zero x
  then negate one
  else if isGreater zero x
  then one
  else zero

sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum xs = reduce add zero xs

void :: forall a b. (Map a) => a b -> a Unit
void x = map (always unit) x
