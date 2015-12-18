module Neon.Data.Dictionary (Dictionary) where

import Neon.Class.Add (class Add, add)
import Neon.Class.Equal (class Equal, equal)
import Neon.Class.FromArray (class FromArray, fromArray)
import Neon.Class.Map (class Map)
import Neon.Class.Reduce (class Reduce)
import Neon.Class.Show (class Show, show)
import Neon.Class.ToArray (class ToArray, toArray)
import Neon.Class.Zero (class Zero)
import Neon.Data.Pair (Pair)

foreign import nativeAdd :: forall a. Dictionary a -> Dictionary a -> Dictionary a
foreign import nativeFromArray :: forall a. Array (Pair String a) -> Dictionary a
foreign import nativeMap :: forall a b. (a -> b) -> Dictionary a -> Dictionary b
foreign import nativeReduce :: forall a b. (b -> a -> b) -> b -> Dictionary a -> b
foreign import nativeToArray :: forall a. Dictionary a -> Array (Pair String a)

foreign import data Dictionary :: * -> *

instance addDictionary :: Add (Dictionary a) where
  add = nativeAdd

instance equalDictionary :: (Equal a) => Equal (Dictionary a) where
  equal x y = equal
    (toArray x :: Array (Pair String a))
    (toArray y :: Array (Pair String a))

instance fromArrayDictionary :: FromArray (Pair String a) (Dictionary a) where
  fromArray = nativeFromArray

instance mapDictionary :: Map Dictionary where
  map = nativeMap

instance reduceDictionary :: Reduce Dictionary where
  reduce = nativeReduce

instance showDictionary :: (Show a) => Show (Dictionary a) where
  show x = add "fromArray " (show (toArray x :: Array (Pair String a)))

instance toArrayDictionary :: ToArray (Dictionary a) (Pair String a) where
  toArray = nativeToArray

instance zeroDictionary :: Zero (Dictionary a) where
  zero = fromArray ([] :: Array (Pair String a))
