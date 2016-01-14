module Test.Neon.Primitive.FunctionSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Function" do
  describe "always" do
    it "always returns the first argument" do
      always 1 unit ?= 1
  describe "compose" do
    it "composes functions" do
      compose (* 2) (+ 2) 3 ?= 10
  describe "flip" do
    it "flips functions" do
      flip add "a" "b" ?= "ab"
  describe "identity" do
    it "returns the argument" do
      identity unit ?= unit
