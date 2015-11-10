module Neon.Primitives.Number
  ( isFinite
  , isInfinite
  , infinity
  , isNaN
  , nan
  ) where

foreign import isFinite :: Number -> Boolean
foreign import isInfinite :: Number -> Boolean
foreign import infinity :: Number
foreign import isNaN :: Number -> Boolean
foreign import nan :: Number
