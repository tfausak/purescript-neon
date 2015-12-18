module Test.Neon.EffectSpec where

import Neon (..)
import Test.Spec (..)
import Test.Neon.Effect.ConsoleSpec (spec) as Console
import Test.Neon.Effect.EffectSpec (spec) as Effect
import Test.Neon.Effect.ExceptionSpec (spec) as Exception

spec :: Spec
spec = describe "Neon.Effect" do
  Console.spec
  Effect.spec
  Exception.spec
