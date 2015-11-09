module Test.Neon.Types.HasMap where

import Neon
import Test.Core (Test(), (==>))

testHasMap :: Test
testHasMap = do
  (+ 1) <$> [1, 2] ==> [2, 3]
  (map (+ 2) (* 2)) 3 ==> 8
  [1, 3] $> 2 ==> [2, 2]
  2 <$ [1, 3] ==> [2, 2]
