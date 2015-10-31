module Neon.Effect
  ( Effect()
  , runPure
  ) where

import Neon.Types.Apply (Apply)
import Neon.Types.Bind (Bind)
import Neon.Types.Map (Map)
import Neon.Types.Pure (Pure)

foreign import data Effect :: # ! -> * -> *
foreign import nativeApplyEffect :: forall e a b. Effect e (a -> b) -> Effect e a -> Effect e b
foreign import nativeBindEffect :: forall e a b. Effect e a -> (a -> Effect e b) -> Effect e b
foreign import nativeMapEffect :: forall e a b. (a -> b) -> Effect e a -> Effect e b
foreign import nativePureEffect :: forall e a. a -> Effect e a
foreign import nativeRunPure :: forall a. Effect () a -> a

instance applyEffect :: Apply (Effect e) where
  apply f x = nativeApplyEffect f x

instance bindEffect :: Bind (Effect e) where
  bind x f = nativeBindEffect x f

instance mapEffect :: Map (Effect e) where
  map f x = nativeMapEffect f x

instance pureEffect :: Pure (Effect e) where
  pure x = nativePureEffect x

runPure :: forall a. Effect () a -> a
runPure x = nativeRunPure x
