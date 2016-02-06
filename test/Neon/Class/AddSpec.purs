module Test.Neon.Class.AddSpec where

import Prelude as Prelude
import Test.Helper

spec :: Spec
spec = describe "Add" do
  it "can add arrays" do
    add [3, 4] [1, 2] ?= [1, 2, 3, 4]
    quickCheck \ (x :: Array Int) y ->
      add y x === Prelude.append x y
  it "can add ints" do
    add 2 1 ?= 3
    quickCheck \ (x :: Int) y ->
      add y x === Prelude.add x y
  it "can add lists" do
    add (Cons 3 (Cons 4 Nil)) (Cons 1 (Cons 2 Nil)) ?= Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))
    -- TODO: Arbitrary instance for lists.
    -- quickCheck \ (x :: List Int) y ->
    --   add y x === Prelude.append x y
  it "can add numbers" do
    add 2.0 1.0 ?= 3.0
    quickCheck \ (x :: Number) y ->
      add y x === Prelude.add x y
  it "can add strings" do
    add "cd" "ab" ?= "abcd"
    quickCheck \ (x :: String) y ->
      add y x === Prelude.append x y
