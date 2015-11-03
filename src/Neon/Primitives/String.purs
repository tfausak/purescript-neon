module Neon.Primitives.String
  ( fromCharArray
  , toCharArray
  ) where

foreign import fromCharArray :: Array Char -> String
foreign import toCharArray :: String -> Array Char
