module Test.Neon.Class.HasTopTest where

import Neon as Neon
import Global as Global
import Prelude as Prelude
import Test.Helper (Suite, discard, assert, suite, test)

tests :: Suite
tests = suite "HasTop" do
  test "Boolean" do
    assert "Prelude.top"
      (Neon.equal (Neon.top :: Boolean) Prelude.top)
  test "Char" do
    assert "Prelude.top"
      (Neon.equal (Neon.top :: Char) Prelude.top)
  test "Int" do
    assert "Prelude.top"
      (Neon.equal (Neon.top :: Int) Prelude.top)
  test "Number" do
    assert "Prelude.negate Global.infinity"
      (Neon.equal (Neon.top :: Number) Global.infinity)
  test "Ordering" do
    assert "Prelude.top"
      (Neon.equal (Neon.top :: Neon.Ordering) Prelude.top)
