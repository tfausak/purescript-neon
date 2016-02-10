module Test.Neon.Class.LessTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Less" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) y ->
      Neon.less y x === x Prelude.< y
  test "Char" do
    quickCheck \ (x :: Char) y ->
      Neon.less y x === x Prelude.< y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.less y x === x Prelude.< y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.less y x === x Prelude.< y
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.less y x === x Prelude.< y