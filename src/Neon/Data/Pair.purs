module Neon.Data.Pair (Pair(Pair), pair) where

import Neon.Class.Add (add)
import Neon.Class.And (and)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.Show (class Show, show)
import Neon.Class.Reduce (reduce)

newtype Pair a b = Pair { first :: a, second :: b }

instance equalPair :: (Equal a, Equal b) => Equal (Pair a b) where
  equal (Pair x) (Pair y) = and
    (equal x.first y.first)
    (equal x.second y.second)

instance showPair :: (Show a, Show b) => Show (Pair a b) where
  show (Pair x) = reduce add ""
    [ "Pair { first: "
    , show x.first
    , ", second: "
    , show x.second
    , " }"
    ]

pair :: forall a b. a -> b -> Pair a b
pair x y = Pair { first: x, second: y }
