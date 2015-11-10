module Test.Neon.Primitives.Function where

import Neon
import Test.Core (Test(), (==>))

testFunction :: Test
testFunction = do
  info "Neon.Primitives.Function"
  constant true unit ==> true
  flip (+) "a" "b" ==> "ba"
  (false |> not) ==> true
  (not <| true) ==> false
