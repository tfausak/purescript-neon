module Neon.Primitive.Int
  ( toNumber
  ) where

foreign import nativeToNumber :: Int -> Number

toNumber :: Int -> Number
toNumber = nativeToNumber
