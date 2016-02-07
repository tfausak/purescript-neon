module Neon.Primitive.Number where

import Data.Int as Int
import Global as Global
import Prelude as Prelude

aNumber :: Number -> Boolean
aNumber x = Prelude.not (Global.isNaN x)

ceiling :: Number -> Int
ceiling x = Int.ceil x

finite :: Number -> Boolean
finite x = Global.isFinite x

floor :: Number -> Int
floor x = Int.floor x

infinity :: Number
infinity = Global.infinity

nan :: Number
nan = Global.nan

round :: Number -> Int
round x = Int.round x
