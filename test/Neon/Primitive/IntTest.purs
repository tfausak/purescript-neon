module Test.Neon.Primitive.IntTest where

import Neon as Neon
import Data.Int as Int
import Test.Helper (Suite, quickCheck, test, (===))

tests :: Suite
tests = test "Int" do
  test "toNumber" do
    quickCheck \ x ->
      Neon.toNumber x === Int.toNumber x
