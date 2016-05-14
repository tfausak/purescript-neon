module Test.Neon.EffectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, test)

tests :: Suite
tests = test "Effect" do
  Prelude.pure Neon.unit
