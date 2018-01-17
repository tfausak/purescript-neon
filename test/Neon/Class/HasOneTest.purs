module Test.Neon.Class.HasOneTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, assert, suite, test)


tests :: Suite
tests = suite "HasOne" do
  test "Int" do
    assert "Prelude.one"
      (Neon.equal (Neon.one :: Int) Prelude.one)
  test "Number" do
    assert "Prelude.one"
      (Neon.equal (Neon.one :: Number) Prelude.one)
