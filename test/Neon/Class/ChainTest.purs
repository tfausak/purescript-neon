module Test.Neon.Class.ChainTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Chain" do
  test "Array" do
    let f x = [x, x]
    quickCheck \ (x :: Array Int) ->
      Neon.chain f x === Prelude.bind x f
  -- test "Eff" do
  test "List" do
    let f x = Neon.Cons x (Neon.Cons x Neon.Nil)
    quickCheck \ (x :: Neon.List Int) ->
      Neon.chain f x === Prelude.bind x f
  test "Maybe" do
    let f x = Neon.Just x
    quickCheck \ (x :: Neon.Maybe Int) ->
      Neon.chain f x === Prelude.bind x f
