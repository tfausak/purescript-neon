module Test.Neon.Class.HasGreaterTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "HasGreater" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.greater y x === x Prelude.> y
  test "Boolean" do
    quickCheck \ (x :: Boolean) y ->
      Neon.greater y x === x Prelude.> y
  test "Char" do
    quickCheck \ (x :: Char) y ->
      Neon.greater y x === x Prelude.> y
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.greater y x === x Prelude.> y
  test "List" do
    quickCheck \ (x :: Neon.List Int) y ->
      Neon.greater y x === x Prelude.> y
  test "Number" do
    quickCheck \ (x :: Number) y ->
      Neon.greater y x === x Prelude.> y
  test "String" do
    quickCheck \ (x :: String) y ->
      Neon.greater y x === x Prelude.> y