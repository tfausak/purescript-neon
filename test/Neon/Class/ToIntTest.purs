module Test.Neon.Class.ToIntTest where

import Neon as Neon
import Data.Enum as Enum
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "ToInt" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.toInt x === Enum.fromEnum x
  test "Char" do
    quickCheck \ (x :: Char) ->
      Neon.toInt x === Enum.fromEnum x
