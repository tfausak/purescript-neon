module Test.Neon.Class.MultiplyTest where

import Neon as Neon
import Test.Core (Tests, bind, quickCheck, test, (===))

tests :: Tests
tests = test "Multiply" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.multiply y x === Prelude.mul x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.multiply y x === Prelude.mul x y
