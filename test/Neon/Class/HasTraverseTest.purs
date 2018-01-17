module Test.Neon.Class.HasTraverseTest where

import Data.Traversable as Traversable
import Neon as Neon
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasTraverse" do
  let f x = Neon.Just x
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      Neon.traverse f x === Traversable.traverse f x
  -- test "List" do
  test "Maybe" do
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.traverse f x === Traversable.traverse f x
