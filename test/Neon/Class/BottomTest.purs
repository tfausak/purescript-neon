module Test.Neon.Class.BottomTest where

import Neon as Neon
import Global as Global
import Prelude as Prelude
import Test.Helper (Suite, assert, bind, test)

suite :: Suite
suite = test "Bottom" do
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
