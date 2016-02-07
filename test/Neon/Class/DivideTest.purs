module Test.Neon.Class.DivideTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Divide" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.divide y x === Prelude.div x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.divide y x === Prelude.div x y
