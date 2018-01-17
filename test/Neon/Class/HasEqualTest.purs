module Test.Neon.Class.HasEqualTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasEqual" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.equal y x === Prelude.eq x y
  test "Boolean" do
    quickCheck \ (x :: Boolean) y ->
      Neon.equal y x === Prelude.eq x y
  test "Char" do
    quickCheck \ (x :: Char) y ->
      Neon.equal y x === Prelude.eq x y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.equal y x === Prelude.eq x y
  test "List" do
    quickCheck \ (x :: Neon.List Int) y ->
      Neon.equal y x === Prelude.eq x y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.equal y x === Prelude.eq x y
  test "Ordering" do
    quickCheck \ (x :: Neon.Ordering) y ->
      Neon.equal y x === Prelude.eq x y
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.equal y x === Prelude.eq x y
  test "Unit" do
    quickCheck \ (x :: Neon.Unit) y ->
      Neon.equal y x === Prelude.eq x y
