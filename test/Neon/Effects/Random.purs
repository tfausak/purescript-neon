module Test.Neon.Effects.Random where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Effects.Random"
  ((>= 0.0) && (< 1.0)) (unsafeRunEffect randomNumber) ==> true
