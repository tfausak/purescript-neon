module Test.Neon.Class.AndSpec where

import Test.Helper

spec :: Spec
spec = describe "And" do
  it "can and arrays" do
    and [2] [1, 2] ?= [2]
  it "can and booleans" do
    and false false ?= false
    and true false ?= false
    and false true ?= false
    and true true ?= true
  it "can and functions" do
    and not not false ?= true
  it "can and lists" do
    and (Cons 2 Nil) (Cons 1 (Cons 2 Nil)) ?= Cons 2 Nil
