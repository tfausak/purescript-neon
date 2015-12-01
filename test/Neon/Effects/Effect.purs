module Test.Neon.Effects.Effect where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Effects.Effect"
  runPure (pure (+ 1) <*> pure 1) ==> 2
  runPure (bind (pure 1) ((+ 1) >> pure)) ==> 2
  runPure (map (+ 1) (pure 1)) ==> 2
  runPure (pure 1) ==> 1
  unsafeRunEffect (pure 1) ==> 1
