module Test.Neon.Class.EqualSpec where

import Test.Helper

spec :: Spec
spec = describe "Equal" do
  it "can equal arrays" do
    equal [1] [1] ?= true
  it "can equal booleans" do
    equal false false ?= true
  it "can equal chars" do
    equal 'a' 'a' ?= true
  it "can equal ints" do
    equal 1 1 ?= true
  it "can equal lists" do
    equal (Cons 1 Nil) (Cons 1 Nil) ?= true
  it "can equal numbers" do
    equal 1.0 1.0 ?= true
  it "can equal strings" do
    equal "a" "a" ?= true
