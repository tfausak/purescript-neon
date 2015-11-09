module Test.Neon.Types.HasApply where

import Neon
import Test.Core (Test(), (==>))

testHasApply :: Test
testHasApply = do
  apply [(+ 1), (+ 2)] [1, 2] ==> [2, 3, 3, 4]
  ((+) <*> (+ 2)) 1 ==> 4
  [1] *> [2] ==> [2]
  [1] <* [2] ==> [1]
