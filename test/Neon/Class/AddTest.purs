module Test.Neon.Class.AddTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Add" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.add y x === Prelude.append x y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.add y x === Prelude.add x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.add y x === Prelude.add x y
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.add y x === Prelude.append x y
