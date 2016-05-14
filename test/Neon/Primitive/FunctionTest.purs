module Test.Neon.Primitive.FunctionTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Function" do
  test "identity" do
    quickCheck \ (x :: Int) ->
      Neon.identity x === Prelude.id x
