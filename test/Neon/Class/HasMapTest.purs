module Test.Neon.Class.HasMapTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "HasMap" do
  let f x = Neon.add 1 x
  test "Array" do
    quickCheck \ (x :: Array Int) ->
      Neon.map f x === Prelude.map f x
  -- test "Eff" do
  test "List" do
    quickCheck \ (x :: Neon.List Int) ->
      Neon.map f x === Prelude.map f x
  test "Maybe" do
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.map f x === Prelude.map f x
