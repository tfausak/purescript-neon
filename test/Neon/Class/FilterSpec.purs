module Test.Neon.Class.FilterSpec where

import Test.Helper

spec :: Spec
spec = describe "Filter" do
  it "can filter arrays" do
    filter (greater 1) [0, 2, 1] ?= [2]
  it "can filter lists" do
    filter (greater 1) (Cons 0 (Cons 2 (Cons 1 Nil))) ?= Cons 2 Nil
