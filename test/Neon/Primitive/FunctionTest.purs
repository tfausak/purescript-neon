module Test.Neon.Primitive.FunctionTest where

import Neon as Neon
import Prelude as Prelude
import Test.Core (Tests, bind, quickCheck, test, (===))

tests :: Tests
tests = test "Function" do
  test "always" do
    quickCheck \ (x :: Int) (y :: Int) ->
      Neon.always y x === Prelude.const x y
  test "compose" do
    let f = Prelude.add 2
        g = Prelude.mul 2
    quickCheck \ (x :: Int) ->
      Neon.compose g f x === Prelude.compose g f x
  test "flip" do
    quickCheck \ (x :: Int) (y :: Int) ->
      Neon.flip Neon.always x y === Prelude.flip Neon.always x y
  test "identity" do
    quickCheck \ (x :: Int) ->
      Neon.identity x === Prelude.id x
