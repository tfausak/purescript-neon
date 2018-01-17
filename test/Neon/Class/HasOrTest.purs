module Test.Neon.Class.HasOrTest where

import Data.Array as Array
import Data.Int.Bits as Bits
import Data.List as List
import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))


tests :: Suite
tests = suite "HasOr" do
  test "Array" do
    quickCheck \ (x :: Array Int) y ->
      Neon.or y x === Array.union x y
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
  test "List" do
    quickCheck \ (x :: Neon.List Int) y ->
      Neon.or y x === List.union x y
