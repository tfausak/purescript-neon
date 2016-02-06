module Test.Neon.Class.GreaterSpec where

import Test.Helper

spec :: Spec
spec = describe "Greater" do
  pending "can compare arrays" -- TODO
  it "can compare booleans" do
    greater false true ?= true
  it "can compare chars" do
    greater 'a' 'b' ?= true
  it "can compare ints" do
    greater 1 2 ?= true
  pending "can compare lists" -- TODO
  it "can compare numbers" do
    greater 1.0 2.0 ?= true
  it "can compare strings" do
    greater "a" "b" ?= true
