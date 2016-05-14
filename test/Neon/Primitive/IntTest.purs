module Test.Neon.Primitive.IntTest where

import Neon as Neon
import Data.Int as Int
import Test.Helper (Suite, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Int" do
  test "toNumber" do
    quickCheck \ x ->
      Neon.toNumber x === Int.toNumber x
