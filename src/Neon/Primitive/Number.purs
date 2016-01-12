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

ceiling :: Number -> Int
ceiling x = Int.ceil x

finite :: Number -> Boolean
finite x = Global.isFinite x

floor :: Number -> Int
floor x = Int.floor x

infinity :: Number
infinity = Global.infinity

isNaN :: Number -> Boolean
isNaN x = Global.isNaN x

nan :: Number
nan = Global.nan

round :: Number -> Int
round x = Int.round x
