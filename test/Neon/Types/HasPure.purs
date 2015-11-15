module Test.Neon.Types.HasPure where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasPure"
  pure 1 ==> [1]
  (pure 1 :: Unit -> Int) unit ==> 1
  when true [unit, unit] ==> [unit, unit]
  unless true [unit, unit] ==> [unit]
