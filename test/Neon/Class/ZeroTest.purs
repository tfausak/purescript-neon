module Test.Neon.Class.ZeroTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, assert, bind, test)

suite :: Suite
suite = test "Zero" do
  test "Array" do
    assert "[]"
      (Neon.equal (Neon.zero :: Array Int) [])
  test "Int" do
    assert "Prelude.zero"
      (Neon.equal (Neon.zero :: Int) Prelude.zero)
  test "List" do
    assert "Nil"
      (Neon.equal (Neon.zero :: Neon.List Int) Neon.Nil)
  test "Number" do
    assert "Prelude.zero"
      (Neon.equal (Neon.zero :: Number) Prelude.zero)
  test "String" do
    assert "\"\""
      (Neon.equal (Neon.zero :: String) "")
