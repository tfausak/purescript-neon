module Test.Neon.EffectSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Effect.ConsoleSpec as Console
import qualified Test.Neon.Effect.EffectSpec as Effect
import qualified Test.Neon.Effect.ExceptionSpec as Exception

main :: Spec
main = describe "Neon.Effect" do
  Console.main
  Effect.main
  Exception.main
