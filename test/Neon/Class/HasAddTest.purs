module Test.Neon.Class.HasAddTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasAdd" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.add y x === Prelude.append x y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.add y x === Prelude.add x y
  test "List" do
    quickCheck \ (x :: Neon.List Int) y ->
      Neon.add y x === Prelude.append x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.add y x === Prelude.add x y
  test "Ordering" do
    quickCheck \ (x :: Neon.Ordering) y ->
      Neon.add y x === Prelude.append x y
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.add y x === Prelude.append x y
