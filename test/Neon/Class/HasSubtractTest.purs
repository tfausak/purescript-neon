module Test.Neon.Class.HasSubtractTest where

import Data.Array as Array
import Data.List as List
import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasSubtract" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.subtract y x === x Array.\\ y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.subtract y x === Prelude.sub x y
  test "List" do
    quickCheck \ (x :: Neon.List Int) y ->
      Neon.subtract y x === x List.\\ y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.subtract y x === Prelude.sub x y
