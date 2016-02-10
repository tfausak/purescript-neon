module Test.Neon.Class.MultiplyTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Multiply" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.multiply y x === Prelude.mul x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.multiply y x === Prelude.mul x y
