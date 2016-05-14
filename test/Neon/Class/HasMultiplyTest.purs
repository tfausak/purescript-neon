module Test.Neon.Class.HasMultiplyTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

tests :: Suite
tests = test "HasMultiply" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.multiply y x === Prelude.mul x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.multiply y x === Prelude.mul x y
