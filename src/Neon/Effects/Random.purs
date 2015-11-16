module Neon.Effects.Random
  ( RANDOM()
  , randomNumber
  ) where

import Neon.Effects.Effect (Effect())

-- | Represents effects that can generate random numbers.
foreign import data RANDOM :: !

-- | Generates a random number. The number will be in the range [0, 1). That
-- | is, `0 <= x < 1`.
-- |
-- | ``` purescript
-- | randomNumber
-- | -- 0.123
-- | ```
foreign import randomNumber :: forall e. Effect (random :: RANDOM | e) Number
