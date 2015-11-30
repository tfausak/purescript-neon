module Test.Neon.Types.HasApply where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasApply"
  apply [(+ 1), (+ 2)] [1, 2] ==> [2, 3, 3, 4]
  ((+) <*> (+ 2)) 1 ==> 4
