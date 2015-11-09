module Test.Neon.Effects.Exception where

import Neon
import Test.Core (Test())

testException :: Test
testException = do
  warn "? Exception" -- TODO
