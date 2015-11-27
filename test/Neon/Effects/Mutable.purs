module Test.Neon.Effects.Mutable where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Effects.Mutable"
  runPure (runMutable do
    r <- newMutableReference unit
    getMutableReference r) ==> unit
  runPure (runMutable do
    r <- newMutableReference false
    setMutableReference r true
    getMutableReference r) ==> true
