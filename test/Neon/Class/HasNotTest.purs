module Test.Neon.Class.HasNotTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))


tests :: Suite
tests = suite "HasNot" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.not x === Prelude.not x
  test "Function" do
    let f = Neon.identity
    quickCheck \ (x :: Boolean) ->
      Neon.not f x === Prelude.not x
