module Test.Neon.Class.WrapTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Wrap" do
  test "Array" do
    quickCheck \ (x :: Int) ->
      Neon.wrap x :: Array Int === Prelude.pure x
  -- test "Eff" do
  test "List" do
    quickCheck \ (x :: Int) ->
      Neon.wrap x :: Neon.List Int === Prelude.pure x
  test "Maybe" do
    quickCheck \ (x :: Int) ->
      Neon.wrap x :: Neon.Maybe Int === Prelude.pure x
