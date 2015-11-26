module Neon.Effects.Mutable
  ( Mutable()
  , MutableReference()
  , getMutableReference
  , newMutableReference
  , runMutable
  , setMutableReference
  ) where

import Neon.Effects.Effect (Effect())

-- | Represents effects that can have local mutation.
foreign import data Mutable :: * -> !

-- | Runs a mutable effect.
-- |
-- | ``` purescript
-- | runPure (runMutable do
-- |   r <- newMutableReference false
-- |   setMutableReference r true
-- |   getMutableReference r)
-- | -- true
-- | ```
foreign import runMutable :: forall s e a. Effect (mutable :: Mutable s | e) a -> Effect e a

-- | Represents a mutable reference that can be run in a `Mutable` effect. The
-- | type `MutableReference s a` can be run with the `Mutable s` effect and
-- | returns a value of type `a`.
foreign import data MutableReference :: * -> * -> *

-- | Creates a new mutable reference. See `runMutable` for an example.
foreign import newMutableReference :: forall s e a. a -> Effect (mutable :: Mutable s | e) (MutableReference s a)

-- | Gets the current value of a mutable reference. See `runMutable` for an
-- | example.
foreign import getMutableReference :: forall s e a. MutableReference s a -> Effect (mutable :: Mutable s | e) a

-- | Sets the mutable reference to a value. See `runMutable` for an example.
foreign import setMutableReference :: forall s e a. MutableReference s a -> a -> Effect (mutable :: Mutable s | e) a
