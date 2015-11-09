module Test.Neon.Effects where

import Neon
import Test.Core (Test())

testEffects :: Test
testEffects = do
  testConsole
  testEffect
  testException
  testRandom

testConsole :: Test
testConsole = do
  warn "? Console" -- TODO

testEffect :: Test
testEffect = do
  warn "? Effect" -- TODO

testException :: Test
testException = do
  warn "? Exception" -- TODO

testRandom :: Test
testRandom = do
  warn "? Random" -- TODO
