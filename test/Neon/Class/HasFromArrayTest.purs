module Test.Neon.Class.HasFromArrayTest where

import Data.Array as Array
import Data.List as List
import Data.String as String
import Neon as Neon
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasFromArray" do
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      (Neon.fromArray x :: Array Int) === x
  test "List" do
    quickCheck \ (x :: Array Int) ->
      (Neon.fromArray x :: Neon.List Int) === List.fromFoldable x
  test "Maybe" do
    quickCheck \ (x :: Array Int) ->
      (Neon.fromArray x :: Neon.Maybe Int) === Array.head x
  test "String" do
    quickCheck \ (x :: Array Char) ->
      (Neon.fromArray x :: String) === String.fromCharArray x
