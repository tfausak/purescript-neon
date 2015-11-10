module Test.Neon.Types.HasBind where

import Neon
import Test.Core (Test(), (==>))

testHasBind :: Test
testHasBind = do
  info "Neon.Types.HasBind"
  bind [1, 2] (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  [1, 2] >>= (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  ((+) =<< (+ 2)) 1 ==> 4
