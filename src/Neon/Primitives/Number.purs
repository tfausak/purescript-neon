module Neon.Primitives.Number
  ( ceiling
  , floor
  , infinity
  , isFinite
  , isNaN
  , nan
  , round
  , truncate
  ) where

  -- | An alias for `NaN` from JavaScript.
foreign import nan :: Number

-- | Tests whether a number is `nan` or not. This is necessary because `nan`
-- | does not equal `nan`.
-- |
-- | ``` purescript
-- | isNaN nan
-- | -- true
-- | isNaN 1.0
-- | -- false
-- | ```
foreign import isNaN :: Number -> Boolean

-- | An alias for `Infinity` from JavaScript.
foreign import infinity :: Number

-- | Tests whether a number is finite or not.
-- |
-- | ``` purescript
-- | isFinite 1.0
-- | -- true
-- | isFinite infinity
-- | -- false
-- | ```
foreign import isFinite :: Number -> Boolean

-- | Rounds a number to the nearest integer.
-- |
-- | ``` purescript
-- | round 1.4
-- | -- 1
-- | ```
foreign import round :: Number -> Int

-- | Rounds a number up.
-- |
-- | ``` purescript
-- | ceiling 1.1
-- | -- 2
-- | ```
foreign import ceiling :: Number -> Int

-- | Rounds a number down.
-- |
-- | ``` purescript
-- | floor 1.9
-- | -- 1
-- | ```
foreign import floor :: Number -> Int

-- | Removes the non-integral component of a number.
-- |
-- | ``` purescript
-- | truncate 1.5
-- | -- 1
-- | truncate (negate 1.5)
-- | -- negate 1
-- | ```
foreign import truncate :: Number -> Int
