module Test.Neon.Class.AndTest where

import Neon as Neon
import Data.Array as Array
import Data.Int.Bits as Bits
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "And" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.and y x === Array.intersect x y
  test "Boolean" do
    quickCheck \ (x :: Boolean) y ->
      Neon.and y x === Prelude.conj x y
  test "Function" do
    let f = Neon.identity
        g = f
    quickCheck \ (x :: Boolean) ->
      Neon.and g f x === Prelude.conj (f x) (g x)
  test "Int" do
    quickCheck \ (x :: Int) y ->
      Neon.and y x === x Bits..&. y
