module Test.Main where

import Neon
import Test.Core (Test())
import Test.Neon (testNeon)

main :: Test
main = do
  testNeon
  info "✔︎ Tests passed."
