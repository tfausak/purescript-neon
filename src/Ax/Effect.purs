module Ax.Effect
  ( Effect()
  , runPure
  ) where

import Ax.Apply (Apply)
import Ax.Bind (Bind)
import Ax.Map (Map)
import Ax.Pure (Pure)

foreign import data Effect :: # ! -> * -> *
foreign import jsApplyEffect :: forall e a b. Effect e (a -> b) -> Effect e a -> Effect e b
foreign import jsBindEffect :: forall e a b. Effect e a -> (a -> Effect e b) -> Effect e b
foreign import jsMapEffect :: forall e a b. (a -> b) -> Effect e a -> Effect e b
foreign import jsPureEffect :: forall e a. a -> Effect e a
foreign import jsRunPure :: forall a. Effect () a -> a

instance applyEffect :: Apply (Effect e) where
  apply f x = jsApplyEffect f x

instance bindEffect :: Bind (Effect e) where
  bind x f = jsBindEffect x f

instance mapEffect :: Map (Effect e) where
  map f x = jsMapEffect f x

instance pureEffect :: Pure (Effect e) where
  pure x = jsPureEffect x

runPure :: forall a. Effect () a -> a
runPure x = jsRunPure x
