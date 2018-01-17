module Test.Neon.Class.HasToArrayTest where

import Data.List as List
import Data.Maybe as Maybe
import Data.String as String
import Neon as Neon
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasToArray" do
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      Neon.toArray x === x
  test "List" do
    quickCheck \ (x :: Neon.List Int) ->
      Neon.toArray x === List.toUnfoldable x
  test "Maybe" do
    quickCheck \ (mx :: Neon.Maybe Int) ->
      Neon.toArray mx === Maybe.maybe [] (\ x -> [x]) mx
  test "String" do
    quickCheck \ (x :: String) ->
      Neon.toArray x === String.toCharArray x
