module Test.Main where

import Test.Core (Test())
import qualified Test.Neon as Neon

main :: Test
main = do
  Neon.main
