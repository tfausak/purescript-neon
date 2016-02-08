module Test.Neon.Class.TraverseTest where

import Data.Traversable as Traversable
import Neon as Neon
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Traverse" do
  let f x = Neon.Just x
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      Neon.traverse f x === Traversable.traverse f x
  -- test "List" do
  test "Maybe" do
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.traverse f x === Traversable.traverse f x
