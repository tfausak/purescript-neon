module Neon.Effects.Random
  ( RANDOM()
  , randomNumber
  ) where

import Neon.Effects.Effect (Effect())

foreign import data RANDOM :: !
foreign import randomNumber :: forall e. Effect (random :: RANDOM | e) Number
