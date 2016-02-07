module Test.Neon.Class.SubtractTest where

import Neon as Neon
import Data.Array as Array
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Subtract" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.subtract y x === x Array.\\ y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.subtract y x === Prelude.sub x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.subtract y x === Prelude.sub x y
