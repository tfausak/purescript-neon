module Neon.Primitive.Int
  ( toNumber
  ) where

import Data.Int as Int

toNumber :: Int -> Number
toNumber x = Int.toNumber x
