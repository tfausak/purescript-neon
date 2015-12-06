module Neon.Data.Dictionary (Dictionary()) where

import Neon.Class.Add (add)
import Neon.Class.Equal (Equal, equal)
import Neon.Class.FromArray (FromArray)
import Neon.Class.Show (Show, show)
import Neon.Class.ToArray (ToArray, toArray)
import Neon.Data.Pair (Pair())

foreign import nativeFromArray :: forall a. Array (Pair String a) -> Dictionary a
foreign import nativeToArray :: forall a. Dictionary a -> Array (Pair String a)

foreign import data Dictionary :: * -> *

instance equalDictionary :: (Equal a) => Equal (Dictionary a) where
  equal x y = equal
    (toArray x :: Array (Pair String a))
    (toArray y :: Array (Pair String a))

instance fromArrayDictionary :: FromArray (Pair String a) (Dictionary a) where
  fromArray = nativeFromArray

instance showDictionary :: (Show a) => Show (Dictionary a) where
  show x = add "fromArray " (show (toArray x :: Array (Pair String a)))

instance toArrayDictionary :: ToArray (Dictionary a) (Pair String a) where
  toArray = nativeToArray
