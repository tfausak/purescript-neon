module Test.Neon.Class.OrTest where

import Neon as Neon
import Data.Int.Bits as Bits
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Or" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) y ->
      Neon.or y x === Prelude.disj x y
  test "Function" do
    let f = Neon.identity
        g = f
    quickCheck \ (x :: Boolean) ->
      Neon.or g f x === Prelude.disj (f x) (g x)
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.or y x === x Bits..|. y
