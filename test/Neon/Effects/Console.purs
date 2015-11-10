module Test.Neon.Effects.Console where

import Neon
import Test.Core (Test())

testConsole :: Test
testConsole = do
  info "Neon.Effects.Console"
  warn "? Console" -- TODO
