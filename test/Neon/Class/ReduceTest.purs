module Test.Neon.Class.ReduceTest where

import Data.Foldable as Foldable
import Neon as Neon
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Reduce" do
  let f x y = Neon.add y x
  test "Array" do
    quickCheck \ (x :: Int) (xs :: Array Int) ->
      Neon.reduce f x xs === Foldable.foldl f x xs
  -- test "Eff" do
  test "Maybe" do
    quickCheck \ (x :: Int) (mx :: Neon.Maybe Int) ->
      Neon.reduce f x mx === Foldable.foldl f x mx
