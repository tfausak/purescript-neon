module Test.Neon.Class.ApplyTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Apply" do
  test "Array" do
    let f x = Neon.add 2 x
        g x = Neon.multiply 2 x
        fs = [f, g]
    quickCheck \ (x :: Array Int) ->
      Neon.apply fs x === Prelude.apply fs x
  -- test "Eff" do
  test "List" do
    let f x = Neon.add 2 x
        g x = Neon.multiply 2 x
        fs = Neon.Cons f (Neon.Cons g Neon.Nil)
    quickCheck \ (x :: Neon.List Int) ->
      Neon.apply fs x === Prelude.apply fs x
  test "Maybe" do
    let f x = Neon.add 2 x
        mf = Neon.Just f
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.apply mf x === Prelude.apply mf x
