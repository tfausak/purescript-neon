module Test.Neon.Class.LessSpec where

import Test.Helper

spec :: Spec
spec = describe "Less" do
  pending "can compare arrays" -- TODO
  it "can compare booleans" do
    less true false ?= true
  it "can compare chars" do
    less 'b' 'a' ?= true
  it "can compare ints" do
    less 2 1 ?= true
  pending "can compare lists" -- TODO
  it "can compare numbers" do
    less 2.0 1.0 ?= true
  it "can compare strings" do
    less "b" "a" ?= true
