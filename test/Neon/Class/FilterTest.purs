module Test.Neon.Class.FilterTest where

import Data.Array as Array
import Neon as Neon
import Test.Helper (Suite, quickCheck, test, (===))

suite :: Suite
suite = test "Filter" do
  test "Array" do
    let f x = Neon.greater 0 x
    quickCheck \ (x :: Array Int) ->
      Neon.filter f x === Array.filter f x
