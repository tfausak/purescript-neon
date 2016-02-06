module Test.Neon.Class.WrapSpec where

import Test.Helper

spec :: Spec
spec = describe "Wrap" do
  it "can wrap arrays" do
    wrap 1 ?= [1]
  it "can wrap lists" do
    wrap 1 ?= Cons 1 Nil
