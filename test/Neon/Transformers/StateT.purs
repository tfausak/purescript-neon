module Test.Neon.Transformers.StateT where

import Neon
import Neon.Transformers -- NOTE: purescript/purescript#1594
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testStateT :: Test
testStateT = do
  let x = StateT (\ x -> Identity (pair unit x))
  -- TODO
  runStateT x 1 ==> Identity (pair unit 1)
