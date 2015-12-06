module Neon.Primitive.Number
  ( ceiling
  , floor
  , infinity
  , nan
  , round
  , truncate
  ) where

foreign import nativeCeiling :: Number -> Int
foreign import nativeFloor :: Number -> Int
foreign import nativeInfinity :: Number
foreign import nativeNan :: Number
foreign import nativeRound :: Number -> Int
foreign import nativeTruncate :: Number -> Int

ceiling :: Number -> Int
ceiling = nativeCeiling

floor :: Number -> Int
floor = nativeFloor

infinity :: Number
infinity = nativeInfinity

nan :: Number
nan = nativeNan

round :: Number -> Int
round = nativeRound

truncate :: Number -> Int
truncate = nativeTruncate
