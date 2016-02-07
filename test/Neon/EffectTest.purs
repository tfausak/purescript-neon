module Test.Neon.EffectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Core (Tests, test)

tests :: Tests
tests = test "Effect" do
  test "Eff" do
    Prelude.pure Neon.unit
