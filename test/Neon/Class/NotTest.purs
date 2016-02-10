module Test.Neon.Class.NotTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Not" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.not x === Prelude.not x
  test "Function" do
    let f = Neon.identity
    quickCheck \ (x :: Boolean) ->
      Neon.not f x === Prelude.not x