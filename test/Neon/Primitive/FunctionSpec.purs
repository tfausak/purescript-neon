module Test.Neon.Primitive.FunctionSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Function" do
  describe "always" do
    it "always returns the first argument" do
      always 1 unit ?= 1
      quickCheck \ (x :: Int) (y :: Unit) -> always x y === x
  describe "compose" do
    it "composes functions" do
      compose (* 2) (+ 2) 3 ?= 10
      let f = (+ 2)
      let g = (* 2)
      quickCheck \ x -> compose g f x === g (f x)
  describe "flip" do
    it "flips functions" do
      flip add "a" "b" ?= "ab"
      quickCheck \ (x :: String) y -> flip add x y === add y x
  describe "identity" do
    it "returns the argument" do
      identity unit ?= unit
      quickCheck \ (x :: Int) -> identity x === x
