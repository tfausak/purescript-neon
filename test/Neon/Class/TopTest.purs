module Test.Neon.Class.TopTest where

import Neon as Neon
import Global as Global
import Prelude as Prelude
import Test.Helper (Suite, assert, bind, test)

suite :: Suite
suite = test "Top" do
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