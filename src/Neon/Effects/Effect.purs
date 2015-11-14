module Neon.Effects.Effect
  ( Effect()
  , runPure
  , unsafeRunEffect
  ) where

import Neon.Types.HasApply (HasApply)
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasMap (HasMap)
import Neon.Types.HasPure (HasPure)

-- | Represents native effects. This type constructor takes two arguments: a
-- | row of effects and a return type. The row of effects gives the native
-- | capabilities of the effect.
-- |
-- | ``` purescript
-- | -- This effect can use the console (like `console.log()` in JavaScript).
-- | forall e. Effect (console :: CONSOLE | e) Unit
-- | ```
foreign import data Effect :: # ! -> * -> *

foreign import nativeApply :: forall e a b. Effect e (a -> b) -> Effect e a -> Effect e b
foreign import nativeBind :: forall e a b. Effect e a -> (a -> Effect e b) -> Effect e b
foreign import nativeMap :: forall e a b. (a -> b) -> Effect e a -> Effect e b
foreign import nativePure :: forall e a. a -> Effect e a
foreign import nativeRunEffect :: forall e a. Effect e a -> a

instance effectHasApply :: HasApply (Effect e) where
  apply f x = nativeApply f x

instance effectHasBind :: HasBind (Effect e) where
  bind x f = nativeBind x f

instance effectHasMap :: HasMap (Effect e) where
  map f x = nativeMap f x

instance effectHasPure :: HasPure (Effect e) where
  pure x = nativePure x

-- | Runs a pure effect.
-- |
-- | ``` purescript
-- | runPure (pure 1)
-- | -- 1
-- | ```
runPure :: forall a. Effect () a -> a
runPure x = nativeRunEffect x

-- | Dangerously runs an effect. In general, you should not use this function.
-- | Sometimes it is necessary to subvert the type system. This can also be
-- | useful for debugging pure functions.
-- |
-- | ``` purescript
-- | unsafeRunEffect (log "..." *> pure 1) :: Int
-- | -- logs "..." and returns `1`
-- | ```
unsafeRunEffect :: forall e a. Effect e a -> a
unsafeRunEffect x = nativeRunEffect x
