module Test.Neon.Types.HasShow where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasShow"
  show [1, 2] ==> "[1, 2]"
  show true ==> "true"
  show 'a' ==> "'a'"
  show '\65535' ==> "'\\65535'"
  show 0 ==> "0"
  show 1.2 ==> "1.2"
  show "neon" ==> "\"neon\""
  show " ~\8\65535" ==> "\" ~\\8\\65535\""
