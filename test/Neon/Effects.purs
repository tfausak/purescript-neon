module Test.Neon.Effects where

import Neon
import Test.Core

testEffects :: Test
testEffects = do
  testEffect
  testException
  testOutput
  testRandom

testEffect :: Test
testEffect = do
  warn "? Effect" -- TODO

testException :: Test
testException = do
  warn "? Exception" -- TODO

testOutput :: Test
testOutput = do
  warn "? Console" -- TODO

testRandom :: Test
testRandom = do
  warn "? Random" -- TODO
