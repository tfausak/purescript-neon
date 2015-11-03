module Neon.Effects.Effect
  ( Effect()
  , runPure
  ) where

import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasPure (HasPure)

foreign import data Effect :: # ! -> * -> *
foreign import nativeApplyEffect :: forall e a b. Effect e (a -> b) -> Effect e a -> Effect e b
foreign import nativeBindEffect :: forall e a b. Effect e a -> (a -> Effect e b) -> Effect e b
foreign import nativeMapEffect :: forall e a b. (a -> b) -> Effect e a -> Effect e b
foreign import nativePureEffect :: forall e a. a -> Effect e a
foreign import runPure :: forall a. Effect () a -> a

instance applyEffect :: HasApply (Effect e) where
  apply f x = nativeApplyEffect f x

instance bindEffect :: HasBind (Effect e) where
  bind x f = nativeBindEffect x f

instance mapEffect :: HasMap (Effect e) where
  map f x = nativeMapEffect f x

instance pureEffect :: HasPure (Effect e) where
  pure x = nativePureEffect x
