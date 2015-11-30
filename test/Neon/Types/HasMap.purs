module Test.Neon.Types.HasMap where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasMap"
  (+ 1) <$> [1, 2] ==> [2, 3]
  (map (+ 2) (* 2)) 3 ==> 8
  void [1, 2] ==> [unit, unit]
  for [1, 2] (+ 1) ==> [2, 3]
