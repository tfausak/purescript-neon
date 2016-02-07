module Test.Neon.OperatorTest where

import Neon as Neon
import Test.Core (Tests, (===), quickCheck, test, bind)

tests :: Tests
tests = test "Operator" do
  test ":" do
    quickCheck \ (x :: Int) ->
      x Neon.: Neon.identity === Neon.identity x
  test "*" do
    quickCheck \ (x :: Int) y ->
      x Neon.* y === Neon.multiply y x
  test "+" do
    quickCheck \ (x :: Int) y ->
      x Neon.+ y === Neon.add y x
