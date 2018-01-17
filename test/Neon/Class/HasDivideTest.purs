module Test.Neon.Class.HasDivideTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasDivide" do
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.divide y x === Prelude.div x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.divide y x === Prelude.div x y
