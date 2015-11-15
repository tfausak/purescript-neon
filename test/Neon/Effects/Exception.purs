module Test.Neon.Effects.Exception where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Effects.Exception"
  show (exception "message") ==> "Error: message"
  runPure (catch (throw (exception "")) (always (pure unit))) ==> unit
