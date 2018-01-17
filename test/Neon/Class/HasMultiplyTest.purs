module Test.Neon.Class.HasMultiplyTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))


tests :: Suite
tests = suite "HasMultiply" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.multiply y x === Prelude.mul x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.multiply y x === Prelude.mul x y
