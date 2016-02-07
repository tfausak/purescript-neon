module Test.Neon.EffectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, test)

suite :: Suite
suite = test "Effect" do
  Prelude.pure Neon.unit
