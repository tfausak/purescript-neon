module Neon.Primitive.Number
  ( ceiling
  , finite
  , floor
  , infinity
  , isNaN
  , nan
  , round
  ) where

import Data.Int as Int
import Global as Global

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

-- | Tests whether a number is `nan` or not. This is necessary because `nan`
-- | does not equal `nan`.
-- |
-- | ``` purescript
-- | isNaN nan -- true
-- | isNaN 1.0 -- false
-- | ```
isNaN :: Number -> Boolean
isNaN x = Global.isNaN x

-- | An alias for `NaN` from JavaScript.
nan :: Number
nan = Global.nan

-- | Rounds a number to the nearest integer.
-- |
-- | ``` purescript
-- | round 1.4 -- 1
-- | ```
round :: Number -> Int
round x = Int.round x
