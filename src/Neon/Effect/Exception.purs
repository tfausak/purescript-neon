module Neon.Effect.Exception (EXCEPTION(), catch, throw) where

import Neon.Effect.Effect (Effect())
import Neon.Data.Exception (Exception())

foreign import nativeCatch :: forall a b. Effect (exception :: EXCEPTION | a) b -> (Exception -> Effect a b) -> Effect a b
foreign import nativeThrow :: forall a b. Exception -> Effect (exception :: EXCEPTION | a) b

foreign import data EXCEPTION :: !

catch :: forall a b. Effect (exception :: EXCEPTION | a) b -> (Exception -> Effect a b) -> Effect a b
catch = nativeCatch

throw :: forall a b. Exception -> Effect (exception :: EXCEPTION | a) b
throw = nativeThrow
