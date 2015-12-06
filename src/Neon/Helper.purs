module Neon.Helper
  ( all
  , any
  , for
  , greaterOrEqual
  , isJust
  , isNothing
  , join
  , lessOrEqual
  , negate
  , notEqual
  , product
  , reciprocal
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
import Neon.Class.Top (Top, top)
import Neon.Class.Zero (Zero, zero)
import Neon.Data.Exception (exception)
import Neon.Data.Maybe (Maybe(Nothing, Just), maybe)
import Neon.Effect.Effect (unsafeRunEffect)
import Neon.Effect.Exception (throw)

all :: forall a b c. (And c, Reduce a, Top c) => (b -> c) -> a b -> c
all p xs = reduce (\ a x -> and a (p x)) top xs

any :: forall a b c. (Bottom c, Or c, Reduce a) => (b -> c) -> a b -> c
any p xs = reduce (\ a x -> or a (p x)) bottom xs

for :: forall a b c. (Map a) => a b -> (b -> c) -> a c
for = flip map

greaterOrEqual :: forall a. (Equal a, Greater a) => a -> a -> Boolean
greaterOrEqual x = or (greater x) (equal x)

isJust :: forall a. Maybe a -> Boolean
isJust = maybe (always true) false

isNothing :: forall a. Maybe a -> Boolean
isNothing = not isJust

join :: forall a b. (Bind a) => a (a b) -> a b
join = flip bind identity

lessOrEqual :: forall a. (Equal a, Less a) => a -> a -> Boolean
lessOrEqual x = or (less x) (equal x)

negate :: forall a. (Subtract a, Zero a) => a -> a
negate = subtract zero

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual = not equal

product :: forall a b. (Multiply b, One b, Reduce a) => a b -> b
product = reduce multiply one

reciprocal :: forall a. (Divide a, One a) => a -> a
reciprocal = divide one

sum :: forall a b. (Add b, Reduce a, Zero b) => a b -> b
sum = reduce add zero

unsafeFromJust :: forall a. Maybe a -> a
unsafeFromJust x = case x of
  Nothing -> unsafeRunEffect (throw (exception "unsafeFromJust"))
  Just j -> j

withDefault :: forall a. a -> Maybe a -> a
withDefault = maybe identity
