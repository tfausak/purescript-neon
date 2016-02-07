module Test.Neon.Primitive.FunctionTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, quickCheck, test, (===))

suite :: Suite
suite = test "Function" do
  test "identity" do
    quickCheck \ (x :: Int) ->
      Neon.identity x === Prelude.id x
