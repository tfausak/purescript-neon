module Test.Neon.Types.HasAlternative where

import Neon
import Test.Core (Test(), (==>))

testHasAlternative :: Test
testHasAlternative = do
  info "Neon.Types.HasAlternative"
  alternative [1] [2] ==> [1, 2]
  [1] <|> [2] ==> [1, 2]
