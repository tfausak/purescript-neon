module Test.Neon.Primitive.IntTest where

import Data.Int as Int
import Neon as Neon
import Test.Core (Tests, quickCheck, test, (===))

tests :: Tests
tests = test "Int" do
  test "toNumber" do
    quickCheck \ x ->
      Neon.toNumber x === Int.toNumber x
