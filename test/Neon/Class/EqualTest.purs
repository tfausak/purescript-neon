module Test.Neon.Class.EqualTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Equal" do
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
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.equal y x === Prelude.eq x y
  test "Unit" do
    quickCheck \ (x :: Neon.Unit) y ->
      Neon.equal y x === Prelude.eq x y
