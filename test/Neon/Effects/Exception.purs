module Test.Neon.Effects.Exception where

import Neon
import Test.Core (Test(), (==>))

testException :: Test
testException = do
  info "Neon.Effects.Exception"
  show (exception "message") ==> "Error: message"
  runPure (catch (throw (exception "")) (constant (pure unit))) ==> unit
