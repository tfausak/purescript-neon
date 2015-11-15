module Test.Main where

import Neon
import Test.Core (Test())
import qualified Test.Neon as Neon

main :: Test
main = do
  Neon.main
