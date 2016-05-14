module Test.Neon.Class.HasPureTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

tests :: Suite
tests = test "HasPure" do
  test "Array" do
    quickCheck \ (x :: Int) ->
      (Neon.pure x :: Array Int) === Prelude.pure x
  -- test "Eff" do
  test "List" do
    quickCheck \ (x :: Int) ->
      (Neon.pure x :: Neon.List Int) === Prelude.pure x
  test "Maybe" do
    quickCheck \ (x :: Int) ->
      (Neon.pure x :: Neon.Maybe Int) === Prelude.pure x
