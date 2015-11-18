module Test.Neon.Primitives.Function where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Primitives.Function"
  always true unit ==> true
  flip (+) "a" "b" ==> "ba"
  ((*) `on` (+ 1)) 2 3 ==> 12
  (false |> not) ==> true
  (not <| true) ==> false
