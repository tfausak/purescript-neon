module Test.Neon.Types.HasCompare where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasCompare"
  compare [1] [1] ==> EqualTo
  lessThan false true ==> true
  greaterThan 'b' 'a' ==> true
  compare (+ 1) (+ 1) ==> LessThan
  let f = (+ 1)
  compare f f ==> EqualTo
  compare 1 1 ==> EqualTo
  lessThanOrEqualTo 0.1 2.3 ==> true
  greaterThanOrEqualTo EqualTo LessThan ==> true
  compare "neon" "neon" ==> EqualTo
  1 < 2 ==> true
  2 <= 2 ==> true
  2 >= 2 ==> true
  3 > 2 ==> true
  min 1 2 ==> 1
  max 1 2 ==> 2
  clamp 2 4 1 ==> 2
  comparing (/ 2) 4 5 ==> EqualTo
