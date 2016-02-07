module Neon.Helper where

import Neon.Class as Class

clamp :: forall a. (Class.Greater a, Class.Less a) => a -> a -> a -> a
clamp b t x =
  if Class.greater t b
  then clamp t b x
  else max b (min t x)

greaterOrEqual :: forall a. (Class.Equal a, Class.Greater a) => a -> a -> Boolean
greaterOrEqual y x = Class.or (Class.equal y x) (Class.greater y x)

lessOrEqual :: forall a. (Class.Equal a, Class.Less a) => a -> a -> Boolean
lessOrEqual y x = Class.or (Class.equal y x) (Class.less y x)

max :: forall a. (Class.Greater a) => a -> a -> a
max y x = if Class.greater y x then x else y

min :: forall a. (Class.Less a) => a -> a -> a
min y x = if Class.less y x then x else y

negate :: forall a. (Class.Subtract a, Class.Zero a) => a -> a
negate x = Class.subtract x Class.zero

notEqual :: forall a. (Class.Equal a) => a -> a -> Boolean
notEqual y x = Class.not (Class.equal y x)
