module Neon.Effects.Effect
  ( Effect()
  , runPure
  ) where

import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasPure (HasPure)

foreign import data Effect :: # ! -> * -> *
foreign import nativeApply :: forall e a b. Effect e (a -> b) -> Effect e a -> Effect e b
foreign import nativeBind :: forall e a b. Effect e a -> (a -> Effect e b) -> Effect e b
foreign import nativeMap :: forall e a b. (a -> b) -> Effect e a -> Effect e b
foreign import nativePure :: forall e a. a -> Effect e a
foreign import runPure :: forall a. Effect () a -> a

instance effectHasApply :: HasApply (Effect e) where
  apply f x = nativeApply f x

instance effectHasBind :: HasBind (Effect e) where
  bind x f = nativeBind x f

instance effectHasMap :: HasMap (Effect e) where
  map f x = nativeMap f x

instance effectHasPure :: HasPure (Effect e) where
  pure x = nativePure x
