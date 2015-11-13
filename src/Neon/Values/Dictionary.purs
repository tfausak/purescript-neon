module Neon.Values.Dictionary
  ( Dictionary()
  ) where

import Neon.Types.HasAdd (HasAdd, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasApply (HasApply)
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasEqual (HasEqual)
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasZero (HasZero, zero)

foreign import data Dictionary :: * -> *

foreign import nativeAddDictionary :: forall a. Dictionary a -> Dictionary a -> Dictionary a
foreign import nativeApplyDictionary :: forall a b. Dictionary (a -> b) -> Dictionary a -> Dictionary b
foreign import nativeEqualDictionary :: forall a. (HasEqual a) => Dictionary a -> Dictionary a -> Boolean
foreign import nativeFoldlDictionary :: forall a b. (b -> a -> b) -> b -> Dictionary a -> b
foreign import nativeFoldrDictionary :: forall a b. (a -> b -> b) -> b -> Dictionary a -> b
foreign import nativeMapDictionary :: forall a b. (a -> b) -> Dictionary a -> Dictionary b
foreign import nativeZeroDictionary :: forall a. Dictionary a

instance dictionaryHasAdd :: HasAdd (Dictionary a) where
  add x y = nativeAddDictionary x y

instance dictionaryHasAlternative :: HasAlternative Dictionary where
  alternative x y = x + y

instance dictionaryHasApply :: HasApply Dictionary where
  apply f x = nativeApplyDictionary f x

instance dictionaryHasEmpty :: HasEmpty Dictionary where
  empty = zero

instance dictionaryHasEqual :: (HasEqual a) => HasEqual (Dictionary a) where
  equal x y = nativeEqualDictionary x y

instance dictionaryHasFold :: HasFold Dictionary where
  foldl f y x = nativeFoldlDictionary f y x
  foldr f y x = nativeFoldrDictionary f y x

instance dictionaryHasMap :: HasMap Dictionary where
  map f x = nativeMapDictionary f x

instance dictionaryHasZero :: HasZero (Dictionary a) where
  zero = nativeZeroDictionary
