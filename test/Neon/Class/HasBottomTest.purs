module Test.Neon.Class.HasBottomTest where

import Neon as Neon
import Global as Global
import Prelude as Prelude
import Test.Helper (Suite, discard, assert, suite, test)

tests :: Suite
tests = suite "HasBottom" do
  test "Boolean" do
    assert "Prelude.bottom"
      (Neon.equal (Neon.bottom :: Boolean) Prelude.bottom)
  test "Char" do
    assert "Prelude.bottom"
      (Neon.equal (Neon.bottom :: Char) Prelude.bottom)
  test "Int" do
    assert "Prelude.bottom"
      (Neon.equal (Neon.bottom :: Int) Prelude.bottom)
  test "Number" do
    assert "Prelude.negate Global.infinity"
      (Neon.equal (Neon.bottom :: Number) (Prelude.negate Global.infinity))
  test "Ordering" do
    assert "Prelude.bottom"
      (Neon.equal (Neon.bottom :: Neon.Ordering) Prelude.bottom)
