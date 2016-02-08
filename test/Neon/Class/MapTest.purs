module Test.Neon.Class.MapTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Map" do
  let f x = Neon.add 1 x
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      Neon.map f x === Prelude.map f x
  -- test "Eff" do
  test "Maybe" do
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.map f x === Prelude.map f x
