module Neon.Effect.Effect (Effect(), runPure, unsafeRunEffect) where

import Neon.Class.Apply (Apply)
import Neon.Class.Bind (Bind)
import Neon.Class.Pure (Pure)

foreign import nativeApply :: forall a b c. Effect a (b -> c) -> Effect a b -> Effect a c
foreign import nativeBind :: forall a b c. Effect a b -> (b -> Effect a c) -> Effect a c
foreign import nativePure :: forall a b. a -> Effect b a
foreign import nativeRunEffect :: forall a b. Effect a b -> b

foreign import data Effect :: # ! -> * -> *

instance applyEffect :: Apply (Effect a) where
  apply = nativeApply

instance bindEffect :: Bind (Effect a) where
  bind = nativeBind

instance pureEffect :: Pure (Effect a) where
  pure = nativePure

runPure :: forall a. Effect () a -> a
runPure = nativeRunEffect

unsafeRunEffect :: forall a b. Effect a b -> b
unsafeRunEffect = nativeRunEffect
