module Test.Neon.DataTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, test)

suite :: Suite
suite = test "Data" do
  Prelude.pure Neon.unit
