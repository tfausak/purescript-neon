module Test.Neon.Class.HasFromArrayTest where

import Data.Array as Array
import Data.String as String
import Neon as Neon
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "HasFromArray" do
  test "Maybe" do
    quickCheck \ (x :: Array Int) ->
      (Neon.fromArray x :: Neon.Maybe Int) === Array.head x
  test "String" do
    quickCheck \ (x :: Array Char) ->
      (Neon.fromArray x :: String) === String.fromCharArray x
