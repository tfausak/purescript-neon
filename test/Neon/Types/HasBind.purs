module Test.Neon.Types.HasBind where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasBind"
  bind [1, 2] (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  join [[1], [2]] ==> [1, 2]
