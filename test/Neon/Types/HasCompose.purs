module Test.Neon.Types.HasCompose where

import Neon
import Test.Core (Test(), (==>))

testHasCompose :: Test
testHasCompose = do
  info "Neon.Types.HasCompose"
  compose (+ 2) (* 2) 3 ==> 10
  ((+ 2) >> (* 2)) 3 ==> 10
  ((+ 2) << (* 2)) 3 ==> 8
