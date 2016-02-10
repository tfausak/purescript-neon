module Test.Neon.Class.AtTest where

import Data.Array as Array
import Data.List as List
import Neon as Neon
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "At" do
  test "Array" do
    quickCheck \ (xs :: Array Char) (i :: Int) ->
      Neon.at i xs === Array.index xs i
  test "List" do
    quickCheck \ (xs :: Neon.List Char) (i :: Int) ->
      Neon.at i xs === List.index xs i
