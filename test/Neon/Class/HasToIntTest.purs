module Test.Neon.Class.HasToIntTest where

import Neon as Neon
import Data.Enum as Enum
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasToInt" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.toInt x === Enum.fromEnum x
  test "Char" do
    quickCheck \ (x :: Char) ->
      Neon.toInt x === Enum.fromEnum x
  test "Int" do
    quickCheck \ (x :: Int) ->
      Neon.toInt x === x
  -- test "Ordering"
