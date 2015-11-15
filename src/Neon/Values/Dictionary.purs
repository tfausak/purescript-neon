module Neon.Values.Dictionary
  ( Dictionary()
  , fromArray
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasShow (HasShow)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Values.Pair (Pair())

-- | Represents a mapping between strings and values.
foreign import data Dictionary :: * -> *

foreign import nativeAdd :: forall a. Dictionary a -> Dictionary a -> Dictionary a
foreign import nativeApply :: forall a b. Dictionary (a -> b) -> Dictionary a -> Dictionary b
foreign import nativeEqual :: forall a. (HasEqual a) => Dictionary a -> Dictionary a -> Boolean
foreign import nativeFoldl :: forall a b. (b -> a -> b) -> b -> Dictionary a -> b
foreign import nativeFoldr :: forall a b. (a -> b -> b) -> b -> Dictionary a -> b
foreign import nativeMap :: forall a b. (a -> b) -> Dictionary a -> Dictionary b
foreign import nativeShow :: forall a. (HasShow a) => Dictionary a -> String
foreign import nativeZero :: forall a. Dictionary a
foreign import nativeFromArray :: forall a. Array (Pair String a) -> Dictionary a

instance dictionaryHasAdd :: HasAdd (Dictionary a) where
  add x y = nativeAdd x y

instance dictionaryHasAlternative :: HasAlternative Dictionary where
  alternative x y = x + y

instance dictionaryHasApply :: HasApply Dictionary where
  apply f x = nativeApply f x

instance dictionaryHasEmpty :: HasEmpty Dictionary where
  empty = zero

instance dictionaryHasEqual :: (HasEqual a) => HasEqual (Dictionary a) where
  equal x y = nativeEqual x y

instance dictionaryHasFold :: HasFold Dictionary where
  foldl f y x = nativeFoldl f y x
  foldr f y x = nativeFoldr f y x

instance dictionaryHasMap :: HasMap Dictionary where
  map f x = nativeMap f x

instance dictionaryHasShow :: (HasShow a) => HasShow (Dictionary a) where
  show x = nativeShow x

instance dictionaryHasZero :: HasZero (Dictionary a) where
  zero = nativeZero

-- TODO: #42
-- | Creates a dictionary from an array of pairs. Each pair has the string key
-- | and the value.
-- |
-- | ``` purescript
-- | fromArray [pair "x" 1] + fromArray [pair "y" 2]
-- | -- fromArray [pair "x" 1, pair "y" 2]
-- | ```
fromArray :: forall a. Array (Pair String a) -> Dictionary a
fromArray x = nativeFromArray x
