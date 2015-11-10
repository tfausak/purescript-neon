module Neon.Primitives.Number
  ( isFinite
  , isInfinite
  , infinity
  , isNaN
  , nan
  , round
  , ceiling
  , floor
  , truncate
  ) where

foreign import isFinite :: Number -> Boolean
foreign import isInfinite :: Number -> Boolean
foreign import infinity :: Number
foreign import isNaN :: Number -> Boolean
foreign import nan :: Number
foreign import round :: Number -> Int
foreign import ceiling :: Number -> Int
foreign import floor :: Number -> Int
foreign import truncate :: Number -> Int
