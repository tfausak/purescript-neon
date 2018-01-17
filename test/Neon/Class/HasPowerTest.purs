module Test.Neon.Class.HasPowerTest where

import Neon as Neon
import Data.Int as Int
import Math as Math
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))


tests :: Suite
tests = suite "HasPower" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.power y x === Int.floor (Math.pow (Int.toNumber x) (Int.toNumber y))
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.power y x === Math.pow x y
