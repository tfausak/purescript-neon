module Neon.Primitives.Char
  ( toLower
  , toUpper
  ) where

foreign import toLower :: Char -> Char
foreign import toUpper :: Char -> Char
