module Test.Neon.Types.HasAlternative where

import Neon
import Test.Core (Test(), (==>))

testHasAlternative :: Test
testHasAlternative = do
  alternative [1] [2] ==> [1, 2]
  [1] <|> [2] ==> [1, 2]
