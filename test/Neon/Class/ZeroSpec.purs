module Test.Neon.Class.ZeroSpec where

import Test.Helper

spec :: Spec
spec = describe "Zero" do
  it "has a zero for arrays" do
    zero ?= ([] :: Array Unit)
  it "has a zero for ints" do
    zero ?= 0
  it "has a zero for lists" do
    zero ?= (Nil :: List Unit)
  it "has a zero for numbers" do
    zero ?= 0.0
  it "has a zero for strings" do
    zero ?= ""
