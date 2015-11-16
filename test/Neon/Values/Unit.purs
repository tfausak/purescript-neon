module Test.Neon.Values.Unit where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Unit"
  unit + unit ==> unit
  unit && unit ==> unit
  bottom ==> unit
  compare unit unit ==> EqualTo
  divide unit unit ==> unit
  modulo unit unit ==> unit
  unit == unit ==> true
  unit * unit ==> unit
  not unit ==> unit
  one ==> unit
  unit || unit ==> unit
  show unit ==> "unit"
  unit - unit ==> unit
  top ==> unit
  zero ==> unit
