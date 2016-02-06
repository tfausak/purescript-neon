module Test.Neon.Class.ReduceSpec where

import Test.Helper

spec :: Spec
spec = describe "Reduce" do
  it "can reduce arrays" do
    reduce add "a" ["b", "c"] ?= "cba"
  it "can reduce lists" do
    reduce add "a" (Cons "b" (Cons "c" Nil)) ?= "cba"
