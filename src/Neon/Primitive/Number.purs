module Neon.Primitive.Number
  ( ceiling
  , floor
  , infinity
  , isFinite
  , isNaN
  , nan
  , round
  , truncate
  ) where

foreign import nativeCeiling :: Number -> Int
foreign import nativeFloor :: Number -> Int
foreign import nativeInfinity :: Number
foreign import nativeIsFinite :: Number -> Boolean
foreign import nativeIsNaN :: Number -> Boolean
foreign import nativeNan :: Number
foreign import nativeRound :: Number -> Int
foreign import nativeTruncate :: Number -> Int

ceiling :: Number -> Int
ceiling = nativeCeiling

floor :: Number -> Int
floor = nativeFloor

infinity :: Number
infinity = nativeInfinity

isFinite :: Number -> Boolean
isFinite = nativeIsFinite

isNaN :: Number -> Boolean
isNaN = nativeIsNaN

nan :: Number
nan = nativeNan

round :: Number -> Int
round = nativeRound

truncate :: Number -> Int
truncate = nativeTruncate
