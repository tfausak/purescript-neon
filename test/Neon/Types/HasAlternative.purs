module Test.Neon.Types.HasAlternative where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasAlternative"
  alternative [1] [2] ==> [1, 2]
  alternative [1] [2] ==> [1, 2]
