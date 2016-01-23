module Test.Neon.Class.OrSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Class" do
  describe "Or" do
    it "can or arrays" do
      or [1, 2] [2, 3] ?= [2, 3, 1]
    it "can or booleans" do
      or false false ?= false
      or false true ?= true
      or true false ?= true
      or true true ?= true
    it "can or functions" do
      or not not false ?= true
    it "can or lists" do
      or (Cons 1 Nil) (Cons 2 Nil) ?= Cons 2 (Cons 1 Nil)
