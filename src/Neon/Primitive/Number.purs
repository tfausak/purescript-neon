module Neon.Primitive.Number
  ( ceiling
  , floor
  , infinity
  , isFinite
  , isNaN
  , nan
  , round
  ) where

import Data.Int as Int
import Global as Global

ceiling :: Number -> Int
ceiling x = Int.ceil x

floor :: Number -> Int
floor x = Int.floor x

infinity :: Number
infinity = Global.infinity

isFinite :: Number -> Boolean
isFinite x = Global.isFinite x

isNaN :: Number -> Boolean
isNaN x = Global.isNaN x

nan :: Number
nan = Global.nan

round :: Number -> Int
round x = Int.round x
