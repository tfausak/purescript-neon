module Neon.Values.Dictionary
  ( Dictionary()
  ) where

import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasEmpty (HasEmpty)
import Neon.Types.HasMap (HasMap)

foreign import data Dictionary :: * -> *

foreign import nativeAlternativeDictioanry :: forall a. Dictionary a -> Dictionary a -> Dictionary a
foreign import nativeEmptyDictionary :: forall a. Dictionary a
foreign import nativeMapDictionary :: forall a b. (a -> b) -> Dictionary a -> Dictionary b

instance dictionaryHasAlternative :: HasAlternative Dictionary where
  alternative x y = nativeAlternativeDictioanry x y

instance dictionaryHasEmpty :: HasEmpty Dictionary where
  empty = nativeEmptyDictionary

instance dictionaryHasMap :: HasMap Dictionary where
  map f x = nativeMapDictionary f x
