module Neon.Primitive.Number where

import Data.Int as Int
import Global as Global
import Prelude as Prelude

-- | Tests if a number is a valid number. Returns false if the number is `nan`.
-- | This is necessary because `nan` does not equal itself.
-- |
-- | ``` purescript
-- | aNumber 1.0 -- true
-- | aNumber nan -- false
-- | nan == nan -- false
-- | ```
aNumber :: Number -> Boolean
aNumber x = Prelude.not (Global.isNaN x)

-- | Rounds a number up.
-- |
-- | ``` purescript
-- | ceiling 1.1 -- 2
-- | ```
ceiling :: Number -> Int
ceiling x = Int.ceil x

-- | Tests whether a number is finite or not.
-- |
-- | ``` purescript
-- | finite 1.0 -- true
-- | finite infinity -- false
-- | ```
finite :: Number -> Boolean
finite x = Global.isFinite x

-- | Rounds a number down.
-- |
-- | ``` purescript
-- | floor 1.9 -- 1
-- | ```
floor :: Number -> Int
floor x = Int.floor x

-- | An alias for `Infinity` from JavaScript.
infinity :: Number
infinity = Global.infinity

-- | An alias for `NaN` from JavaScript.
nan :: Number
nan = Global.nan

-- | Rounds a number to the nearest integer.
-- |
-- | ``` purescript
-- | round 1.4 -- 1
-- | round 1.6 -- 2
-- | round 1.5 -- 2
-- | round 2.5 -- 3
-- | ```
round :: Number -> Int
round x = Int.round x
