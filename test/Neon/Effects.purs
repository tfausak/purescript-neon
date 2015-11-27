module Test.Neon.Effects where

import Neon
import Test.Core (Test())
import qualified Test.Neon.Effects.Console as Console
import qualified Test.Neon.Effects.Effect as Effect
import qualified Test.Neon.Effects.Exception as Exception
import qualified Test.Neon.Effects.Mutable as Mutable
import qualified Test.Neon.Effects.Random as Random

main :: Test
main = do
  info "Neon.Effects"
  Console.main
  Effect.main
  Exception.main
  Mutable.main
  Random.main
