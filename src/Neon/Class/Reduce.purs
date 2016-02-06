module Neon.Class.Reduce where

import Data.Foldable as Foldable
import Neon.Data as Data

-- | Represents types that can be reduced to a single value. This is also known
-- | as a [fold](https://en.wikipedia.org/wiki/Fold_(higher-order_function)).
-- |
-- | ``` purescript
-- | reduce (+) "hello" ["wo", "rl", "d!"] -- "helloworld!"
-- | ```
class Reduce a where
  reduce :: forall b c. (c -> b -> c) -> c -> a b -> c

instance reduceArray :: Reduce Array where
  reduce f x xs = Foldable.foldl f x xs

instance reduceList :: Reduce Data.List where
  reduce f x xs = Foldable.foldl f x xs

instance reduceMaybe :: Reduce Data.Maybe where
  reduce f x mx = Foldable.foldl f x mx
