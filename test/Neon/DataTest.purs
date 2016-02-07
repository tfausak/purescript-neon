module Test.Neon.DataTest where

import Neon as Neon
import Prelude as Prelude
import Test.Core (Tests, test)

tests :: Tests
tests = test "Data" do
  test "Unit" do
    Prelude.pure Neon.unit
