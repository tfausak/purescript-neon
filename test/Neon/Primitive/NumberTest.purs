module Test.Neon.Primitive.NumberTest where

import Neon as Neon
import Data.Int as Int
import Global as Global
import Prelude as Prelude
import Test.Helper (Suite, assert, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Number" do
  test "aNumber" do
    quickCheck \ x ->
      Neon.aNumber x === Prelude.not (Global.isNaN x)
  test "ceiling" do
    quickCheck \ x ->
      Neon.ceiling x === Int.ceil x
  test "finite" do
    quickCheck \ x ->
      Neon.finite x === Global.isFinite x
  test "floor" do
    quickCheck \ x ->
      Neon.floor x === Int.floor x
  test "infinity" do
    assert "Global.infinity" (Neon.equal Neon.infinity Global.infinity)
  test "nan" do
    assert "Global.nan" (Neon.notEqual Neon.nan Global.nan)
  test "round" do
    quickCheck \ x ->
      Neon.round x === Int.round x
