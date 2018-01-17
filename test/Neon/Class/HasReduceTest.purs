module Test.Neon.Class.HasReduceTest where

import Data.Foldable as Foldable
import Neon as Neon
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))


tests :: Suite
tests = suite "HasReduce" do
  let f x y = Neon.add y x
  test "Array" do
    quickCheck \ (x :: Int) (xs :: Array Int) ->
      Neon.reduce f x xs === Foldable.foldl f x xs
  -- test "Eff" do
  test "List" do
    quickCheck \ (x :: Int) (xs :: Neon.List Int) ->
      Neon.reduce f x xs === Foldable.foldl f x xs
  test "Maybe" do
    quickCheck \ (x :: Int) (mx :: Neon.Maybe Int) ->
      Neon.reduce f x mx === Foldable.foldl f x mx
