module Test.Neon.Transformers where

import Neon
import Test.Core (Test())

testTransformers :: Test
testTransformers = do
  testMaybeT
  testStateT

testMaybeT :: Test
testMaybeT = do
  warn "? MaybeT" -- TODO

testStateT :: Test
testStateT = do
  warn "? StateT" -- TODO
